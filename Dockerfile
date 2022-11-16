FROM percona/percona-xtradb-cluster:5.7.25
USER root
RUN apt-get update \
    && apt-get install sudo
RUN usermod -aG sudo mysql
COPY mysql ./etc/sudoers.d/
COPY entrypoint.sh ./
USER mysql
RUN sudo apt-get install init-system-helpers \
    && sudo apt-get install pmm2-client percona-toolkit -y \
    && sudo rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 3306
USER 1001
CMD [""]
