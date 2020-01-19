两条命令装kubernetes 1.16.0高可用集群： wget https://github.com/fanux/sealos/releases/download/v2.0.7/sealos && chmod +x sealos && mv sealos /usr/bin

sealos init --user root --passwd  123456 --master 192.168.50.200 --node 192.168.50.217 --pkg-url https://sealyun.oss-cn-beijing.aliyuncs.com/cf6bece970f6dab3d8dc8bc5b588cc18-1.16.0/kube1.16.0.tar.gz --version v1.16.0

机器，只需要上面两天命令，检测docker是否存在，不存在自动装