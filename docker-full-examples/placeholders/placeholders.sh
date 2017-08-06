#! /bin/bash -e

# We execute our placeholders to search and replace all our placeholders. THis tool will take as arguments all the environement variables define in the docker-compose.yml file :
# PLACEHOLDERSKIT_EXTENSIONS, PLACEHOLDERSKIT_FOLDERS, PLACEHOLDERSKIT_CONSUL-ADDRESS, PLACEHOLDERSKIT_CONSUL-DATACENTER & PLACEHOLDERSKIT_CONSUL-ENDPOINT-ENVIRONMENT

export HOME_APP="/app"

placeholders -verbose="true"

cd $HOME_APP
dotnet aspnetapp.dll

# As argument is not dotnet, assume user want to run his own process, for example a `bash` shell to explore this image
exec "$@"
