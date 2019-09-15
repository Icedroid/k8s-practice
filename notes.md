# k8s 学习笔记

## POD基本概念

POD看成是虚拟机，容器就是虚拟机的进程

凡是调度、网络、存储，以及安全相关的属性，基本上是 Pod级别的
HostAliases：定义了 Pod 的 hosts 文件，用法如下：

```yaml
apiVersion: v1
kind: Pod
...
spec:
  hostAliases:
  - ip: "10.1.2.3"
    hostnames:
    - "foo.remote"
    - "bar.remote"
```

```
// 启用一个一次性容器：
kubectl run -i --tty --image busybox:1.28.4  dns-test --restart=Never --rm /bin/sh

// 在运行的Pod中执行命令：
kubectl exec web-0 -- sh -c "hostname"
```

## statefulset
StatefulSet 的设计思想：StatefulSet 其实就是一种特殊的 Deployment，而其独特之处在于，它的每个 Pod 都被编号了。
创建statefulset 之前必须先创建一个headless service

可以看到，StatefulSet 管理的“有状态应用”的多个实例，也都是通过同一份 Pod 模板创建出来的，使用的是同一份 Pod 模板创建出来的，使用的是同一个 Docker 镜像。如果应用要求不同节点的镜像不一样，就不能再使用StatefulSet了，而应该使用Operator。

### pv与pvc
Kubernetes 中 PVC 和 PV 的设计，实际上类似于“接口”和“实现”的思想。开发者只要知道并会使用“接口”，即：PVC；而运维人员则负责给“接口”绑定具体的实现。
PVC 其实就是一种特殊的 Volume。

### envoy
envoy提供了api形式的配置入口，更方便做流量治理