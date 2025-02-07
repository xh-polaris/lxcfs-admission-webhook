# Kubernetes Admission Webhook for LXCFS

本项目从`https://github.com/denverdino/lxcfs-admission-webhook` fork而来

本项目依赖cert manager，需要集群中已安装cert manager

webhook里的配置默认是**针对所有namespace生效**，可以通过为特定的namespace（比如说CNI等参与pod生命周期的应用所在namespace）添加标签lxcfs-admission-webhook=disable来禁用，避免循环依赖导致无法启动pod
