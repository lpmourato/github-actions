FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env

COPY . /app
WORKDIR /app

RUN ["dotnet", "restore"]

RUN dotnet publish -c Release -o out
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

WORKDIR /app

COPY --from=build-env /app/out .
EXPOSE 5000

CMD ["dotnet", "ApiProject.dll"]