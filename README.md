# PlaceholdersKit

Placeholder text until I can flesh this out more. I'll throw the source up on here for a later release (when I'm more happy with it, because it's my first Golang program); only created the Repo this early to host an Alpha release. Thank you for your patience and for your feedbacks ...

This program is useful for a Docker multi-environment deployment scenarios (such as INT, DEV, UAT, PRE-PROD, PROD environments, etc ...). Of course, it can be use for another type of multi-environment deployment scenarios : Cloud On-Promise, CSP, etc ..

# Goals and why this tool is useful :

* We have exactly the same docker image (same tag) : with the same binaries, application files and configurations files (with all the placeholders). All these files are already on the target(s) folder(s) of the docker application.

* Placeholders are configurable entries in your application that will be set to an actual value at deployment time. This allows the deployment docker image to be **environment-independent and thus reusable**.

* At deployment time, the placeholders will be resolved from dictionaries (taken from a Consul KV store) that are assigned to the target environment. During the deployment, that can be assimilated as a "run" goal for Docker ecosystem (docker stack deploy, docker-compose up, docker run ... ), the PlaceholdersKit tool will replace all the placeholders, all the key names which are delimeter by {{...}} per default with their own values (KV Pairs). These replacements in all your configuration files (you have to define only the extension files for beeing scan and finding in their content all the placeholders such as config, properties, xml files ...) will be done with the correct value _**depend on the target deployment environment**_. 

* These environment values are taken from a Consul KV store during the deployment ("on the fly/live streaming"). The primary use case for this PlaceholdersKit tool is to be able to build native Consul-based configuration into your Docker image without needing glue such as environement variables, use tempories files, multiple sed commands, copy/move files, etc ...

# What are the command line arguments for this PlaceholdersKit tool ?

The command line arguments are :

_**-h**_ :<br />
Help of the PlaceholdersKit tool which explain all the command line arguments. <br />

_**-verbose**_ :<br />
List all the Key placeholders scan in all the fullpath files with the desire extensions. <br />
_(default "false")_

_**-extensions**_ :<br />
All desire extension files to scan for placeholders. <br />
_(default "xml,properties,config,txt")_

_**-folders**_ :<br />
All folders root to scan the define extensions files for placeholders (deep search in all tree folders/recursivity per default). <br />
_(default "c:/MyApplicationRoot")_

_**-consulAddress**_ :<br />
Consul Server Address to search all KV Pairs for feeding our placeholders files in a streaming live process. <br />
_(default "consul.fboukezzoula.intra:8500")_

_**-consulDataCenter**_ :<br />
Datacenter in your Consul to use. This property can be blank. <br />
_(default "mustach-project")_

_**-consulEndpointEnvironment**_ :<br />
The URI root path of our Consul KV store to extract all the KV Pairs. <br />
_(default "/dev/")_

The PlaceholdersKit tool use the Consul Hashicorp api package. If you need more arguments for accessing to your Consul infrastructure, you can easily define the standard environment variables (_CONSUL_HTTP_ADDR, CONSUL_HTTP_TOKEN, CONSUL_HTTP_AUTH, CONSUL_HTTP_SSL, CONSUL_CACERT_, etc ...) for creating a new consul client by calling NewClient function with a Config object as argument. We create easily this Config object by calling the DefaultConfig function and change attribues like Address, Scheme, Datacenter, etc ...   

In most of the cases, our 3 arguments (_**consulAddress, consulDataCenter, consulEndpointEnvironment**_) will be ample enough. 

The full documentation is available on [Godoc](https://godoc.org/github.com/hashicorp/consul/api)

<p align="center">
  <img src="ressources/arguments_cmd_line.png" width="1028"/>
  <img src="ressources/consul.png" width="1028"/>
</p>

# Examples of using the PlaceholdersKit command line :

* On Windows (cmd) :

```
placeholders.exe -verbose=true -extensions=xml,config -folders=c:/MyApplicationRoot -consulAddress=consul.fboukezzoula.intra:8500 -consulDataCenter=mustach-project -consulEndpointEnvironment=/dev/
```

* On Linux (shell) :

```
placeholders -verbose=true -extensions=xml,config -folders=/home/userapplication/MyApplicationRoot -consulAddress=consul.fboukezzoula.intra:8500 -consulDataCenter=mustach-project -consulEndpointEnvironment=/dev/
```

# Examples of using the PlaceholdersKit in Docker ecosystem :
