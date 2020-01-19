# 安装jaeger

安装完jaeger-operator后需要执行这个文件

This will install the default AllInOne strategy, which deploys the “all-in-one” image (agent, collector, query, ingestor, Jaeger UI) in a single pod, using in-memory storage by default.

```bash
kubectl apply -f jaeger.yaml --namespace ecf-system
```