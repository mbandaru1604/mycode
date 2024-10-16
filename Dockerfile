FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
RUN apt update -y && apt install -y wget && \
    wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.bookworm_amd64.deb && \
    chmod 777 wkhtmltox_0.12.6.1-3.bookworm_amd64.deb && \
    apt install -y ./wkhtmltox_0.12.6.1-3.bookworm_amd64.deb

WORKDIR /app
COPY app/publish .
ENTRYPOINT ["dotnet", "BBSI.ATS.API.dll"]
