# helm笔记


## 本机执行的helm安装

```bash
helm install stable/mysql
NAME:   youngling-lynx
LAST DEPLOYED: Tue Sep  3 21:30:33 2019
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/ConfigMap
NAME                       DATA  AGE
youngling-lynx-mysql-test  1     0s

==> v1/PersistentVolumeClaim
NAME                  STATUS  VOLUME                                    CAPACITY  ACCESS MODES  STORAGECLASS  AGE
youngling-lynx-mysql  Bound   pvc-01f838ce-ce4f-11e9-bd29-025000000001  8Gi       RWO           hostpath      0s

==> v1/Pod(related)
NAME                                   READY  STATUS   RESTARTS  AGE
youngling-lynx-mysql-84bb44f875-tkkpd  0/1    Pending  0         0s

==> v1/Secret
NAME                  TYPE    DATA  AGE
youngling-lynx-mysql  Opaque  2     0s

==> v1/Service
NAME                  TYPE       CLUSTER-IP   EXTERNAL-IP  PORT(S)   AGE
youngling-lynx-mysql  ClusterIP  10.100.54.3  <none>       3306/TCP  0s

==> v1beta1/Deployment
NAME                  READY  UP-TO-DATE  AVAILABLE  AGE
youngling-lynx-mysql  0/1    1           0          0s


NOTES:
MySQL can be accessed via port 3306 on the following DNS name from within your cluster:
youngling-lynx-mysql.default.svc.cluster.local

To get your root password run:

    MYSQL_ROOT_PASSWORD=$(kubectl get secret --namespace default youngling-lynx-mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode; echo)

To connect to your database:

1. Run an Ubuntu pod that you can use as a client:

    kubectl run -i --tty ubuntu --image=ubuntu:16.04 --restart=Never -- bash -il

2. Install the mysql client:

    $ apt-get update && apt-get install mysql-client -y

3. Connect using the mysql cli, then provide your password:
    $ mysql -h youngling-lynx-mysql -p

To connect to your database directly from outside the K8s cluster:
    MYSQL_HOST=127.0.0.1
    MYSQL_PORT=3306

    # Execute the following command to route the connection:
    kubectl port-forward svc/youngling-lynx-mysql 3306

    mysql -h ${MYSQL_HOST} -P${MYSQL_PORT} -u root -p${MYSQL_ROOT_PASSWORD}
```