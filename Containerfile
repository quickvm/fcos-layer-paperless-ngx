FROM quay.io/fedora/fedora-coreos:stable
COPY etc /etc
COPY usr /usr
RUN rpm-ostree install systemd-oomd-defaults && \
    rpm-ostree cleanup -m && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    systemctl enable pngx-pod.service && \
    systemctl enable pngx-postgres.service && \
    systemctl enable pngx-redis.service && \
    systemctl enable pngx-tika.service && \
    systemctl enable pngx-gotenberg.service && \
    systemctl enable pngx-webserver.service && \
    systemctl enable pngx-sftpgo.service && \
    systemctl enable rpm-ostreed-automatic.timer
RUN ostree container commit
