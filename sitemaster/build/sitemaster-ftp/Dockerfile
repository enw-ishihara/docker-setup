FROM almalinux:9.1

RUN dnf install -y \
    passwd \
    vsftpd \
 && dnf clean all

RUN useradd -u 1000 admin \
 && echo "admin" | passwd --stdin admin

COPY vsftpd.conf /etc/vsftpd/
COPY user_list /etc/vsftpd/
COPY chroot_list /etc/vsftpd/

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
