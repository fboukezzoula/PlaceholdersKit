# PlaceholdersKit

Placeholder text until I can flesh this out more. I'll throw the source up on here for a later release (when I'm more happy with it, because it's my first Golang program), only created the Repo this early to host an Alpha release. Thank you for your patience and for your feedbacks ...

This program is useful for a Docker multi-environment deployment scenarios (INT, DEV, UAT, PRE-PROD, PROD environments, etc ...). Of course, it can be use for another type of multi-environment deployment scenarios : Cloud On-Promise, CSP, etc ..

# Goals and why this tool is useful :

* We have exactly the same docker image (same tag) : with the same binaries, application files and configurations files. All these files are already on the target(s) folder(s).

* Placeholders are configurable entries in your application that will be set to an actual value at deployment time. This allows the deployment docker image to be environment-independent and thus reusable.

* At deployment time, the placeholders will be resolved from dictionaries (taken from a Consul KV store) that are assigned to the target environment. During the deployment, "run" (docker stack deploy, docker-compose up, docker run ... ), we will replace all the placeholders, the key names are delimeter by {{...}} per default, in all your configuration files with the correct value _**depend on the target deployment environment**_. 

* These environment values are taken from a Consul KV store during the deployment ("on the fly/live streaming").The primary use case for this PlaceholdersKit tool is to be able to build native Consul-based configuration into your Docker image without needing glue such as environement variables, tempories files, multiple sed command,copy/move files, etc ...






