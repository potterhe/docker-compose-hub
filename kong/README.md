[DB-less and Declarative Configuration](https://docs.konghq.com/gateway/3.7.x/production/deployment-topologies/db-less-and-declarative-config/)


```sh
curl http://localhost:8001/services
curl http://localhost:8001/routes
```

## 问题

- 如果在不同的service上定义了相同的路由，行为是：后者覆盖？如果避免配置冲突。`Once a route is matched, Kong Gateway proxies the request to its associated service`
- route 的 name 不能冲突，如何规避？
- 如果使用Gateway API，插件如何声明。https://docs.konghq.com/kubernetes-ingress-controller/latest/plugins/custom/


##

/usr/local/share/lua/5.1/kong/

/usr/local/openresty/nginx/sbin/nginx -p /usr/local/kong -c nginx.conf


curl --resolve 'xlocal2.xjjj.co:8443:127.0.0.1' https://xlocal2.xjjj.co:8443/anything -k -vvv

## 启动

/docker-entrypoint.sh
"Cmd": [
                "kong",
                "docker-start"
            ]

```
kong prepare
```

## Plugin

[Key-Auth source code](https://github.com/Kong/kong/tree/master/kong/plugins/key-auth)
[response函数在https上不工作问题](https://support.konghq.com/support/s/article/Kong-Gateway-Notice-in-logs-response-buffering-was-turned-off-incompatible-HTTP-version-2)

### basic auth

```sh
curl -H 'Authorization: Basic QWxhZGRpbjpPcGVuU2VzYW1l' http://localhost:8000/anything
```

### jwt auth

curl http://localhost:8000/xxx \
 -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJZSmRtYUR2VlRKeHRjV1JDdmtNaWtjOG9FTGdBVk5jeiIsImV4cCI6MTQ0MjQzMDA1NCwibmJmIjoxNDQyNDI2NDU0LCJpYXQiOjE0NDI0MjY0NTR9.WuLdHyvZGj2UAsnBl6YF9A4NqGQpaDftHjX18ooK8YY'

curl http://localhost:8000/xxx \
 -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJZSmRtYUR2VlRKeHRjV1JDdmtNaWtjOG9FTGdBVk5jeiIsInN1YiI6ImRlbW8iLCJpYXQiOjE3MjQ3NDE0MjMsIm5iZiI6MTcyNDc0MTQyMywiZXhwIjoxNzI0ODI3ODIzfQ.SfwHuM2GatMIxSuUFVfn5d9_nYOnB3LcBLmp5OyKW-A'

## todo

[Develop Custom Plugins](https://docs.konghq.com/gateway/latest/plugin-development/get-started/setup/) 将response替换为 header_filter , 原因 [response函数在https上不工作问题](https://support.konghq.com/support/s/article/Kong-Gateway-Notice-in-logs-response-buffering-was-turned-off-incompatible-HTTP-version-2)

## Kong Manager

[Kong Manager](https://github.com/Kong/kong-manager/discussions/74)

## 观测

curl -s localhost:8001/metrics
http://localhost:16686/search