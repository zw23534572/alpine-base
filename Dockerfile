FROM alpine:3.7

RUN apk add --update bash vim curl
# RUN apk add --update bash vim ca-certificates openrc curl
# ADD sgerrand.rsa.pub /etc/apk/keys/sgerrand.rsa.pub
# COPY glibc-2.25-r0.apk /packages/glibc-2.25-r0.apk
# COPY glibc-bin-2.25-r0.apk /packages/glibc-bin-2.25-r0.apk
# COPY glibc-i18n-2.25-r0.apk /packages/glibc-i18n-2.25-r0.apk
# RUN cd /packages && apk add glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk glibc-2.25-r0.apk

# RUN /usr/glibc-compat/bin/localedef -i zh_CN -f UTF-8 zh_CN.UTF-8

# ENV LANG=zh_CN.UTF-8 \
#     LANGUAGE=zh_CN.UTF-8

# ADD Shanghai /usr/share/zoneinfo/Asia/
# RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
#     echo 'Asia/Shanghai' >/etc/timezone

# RUN echo "*	*	*	*	*	ntpd -Nqp 1.cn.pool.ntp.org" >> /var/spool/cron/crontabs/root

RUN rm -rf /var/cache/apk/* && rm -rf /packages


RUN mkdir -p /export/App && \
    mkdir -p /export/Domains && \
    mkdir -p /export/logs
    
#系统脚本
ADD script/init.sh /export/servers/script/init.sh
ADD script/startup.sh /export/servers/script/startup.sh
ADD script/shutdown.sh /export/servers/script/shutdown.sh
ADD logs/startup.log /export/logs/startup.log

#用户脚本
ADD script/start.sh /export/servers/script/start.sh
ADD script/stop.sh /export/servers/script/stop.sh

RUN chmod +x /export/servers/script/*.sh

#增加启动服务
# ADD crond /etc/init.d/crond
# RUN chmod +x /etc/init.d/crond
# RUN rc-update add crond boot
# RUN openrc
# RUN touch /run/openrc/softlevel

CMD ["bash", "/export/servers/script/init.sh"]