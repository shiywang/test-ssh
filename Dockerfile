FROM fedora:28

ADD uid_entrypoint /usr/local/bin/uid_entrypoint
ADD sshlogin /usr/local/bin/sshlogin
RUN dnf install openssh-clients sshpass expect sudo -y
RUN chmod g=u /etc/passwd; \
    chmod +x /usr/local/bin/uid_entrypoint; \
    chmod +x /usr/local/bin/sshlogin
ENTRYPOINT [ "/usr/local/bin/uid_entrypoint" ]
USER 1001
