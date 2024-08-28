local MyPluginHandler = {
    PRIORITY = 1000,
    VERSION = "0.0.1",
}

function MyPluginHandler:access(conf)
    local request_headers = kong.request.get_headers()
    local package = request_headers["package"]
    if package == "jojo" then
        local ctx = ngx.ctx
        kong.log.notice("balancer_data:", ctx.balancer_data.host, ctx.balancer_data.port)
        kong.service.set_target("echo-api.3scale.net", 80)
    end
end

function MyPluginHandler:header_filter(conf)
    kong.response.set_header("X-MyPlugin", "response")
end

return MyPluginHandler
