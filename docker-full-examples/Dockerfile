FROM microsoft/aspnetcore-build:1.1 AS build-env
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

COPY /placeholders/placeholders.sh out
RUN ls -al out

# build runtime image
FROM microsoft/aspnetcore:1.1
WORKDIR /app

COPY /placeholders/placeholders /usr/local/bin/placeholders

COPY --from=build-env /app/out .

RUN chmod +x /usr/local/bin/placeholders && chmod +x /app/placeholders.sh

ENTRYPOINT ["/app/placeholders.sh"]

