FROM centos:7
ENV container docker
RUN yum clean all && rm -rf /var/cache/yum && \
yum update -y && yum install git curl wget vim nano net-tools openssh-server openssh-client -y && \
git clone https://github.com/gyxuehu/EwoMail.git && cd EwoMail/install && sh start.sh ewomail.cn && \
yum erase git -y && yum clean all && rm -rf /var/cache/yum && \
touch /var/log/secure /etc/sysconfig/network && \
rm -rf /EwoMail && systemctl mask getty@tty1.service
STOPSIGNAL SIGRTMIN+4
CMD ["/usr/sbin/init"]
