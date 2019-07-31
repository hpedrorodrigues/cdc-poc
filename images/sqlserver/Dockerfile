FROM mcr.microsoft.com/mssql/server:2019-CTP3.1-ubuntu

COPY scripts/*.sql /poc/
COPY start.sh /poc/

ENTRYPOINT [ "/poc/start.sh" ]
