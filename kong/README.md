[DB-less and Declarative Configuration](https://docs.konghq.com/gateway/3.7.x/production/deployment-topologies/db-less-and-declarative-config/)


```sh
curl http://localhost:8001/services
curl http://localhost:8001/routes
```

## 问题

- 如果在不同的service上定义了相同的路由，行为是：后者覆盖？如果避免配置冲突。`Once a route is matched, Kong Gateway proxies the request to its associated service`
- route 的 name 不能冲突，如何规避？
- 如果使用Gateway API，插件如何声明。https://docs.konghq.com/kubernetes-ingress-controller/latest/plugins/custom/
