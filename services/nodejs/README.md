# CloudCenter NodeJS Service

![NodeJS Icon](https://nodejs.org/static/images/logos/nodejs-new-pantone-black.png)

This is an example of deploying NodeJS with Cisco Cloud Center. It was the initial service that I created to learn how to use CloudCenter to deploy services.

## Supported Environments
* CentOS (6 and 7 tested)
* Added logic for Ubuntu however not tested yet!


## Operating
You should zip your NodeJS code/scripts and any dependencies up, e.g.
```
zip application.zip application.js
```
An example NodeJS application component that I used for the development of this service makes up part of the ['Mrs Miggins Pie Voting'](xxx) application I have previously used in demos. It is based on the [container end-to-end example](https://github.com/clijockey/miggins-vote-app).

You can then make this available to the service by setting the following custom parameters:

* ```NodejsAppRuntime``` - The version of NodeJS that you want to install. I configured this as a 'list' (5.x,6.x,7.x)
* ```NodejsAppPackage``` - URL to a zip file containing the script + any other values, for example ```http://cloud-center-bundle.ukidcv.cisco.com/apps/result.zip```.
* ```NodejsMainEntry``` - the name of the primary file to execute, for example ```server.js```

You can also use the following parameters:

* ```ENABLE_PROXY``` - if set to ```Enabled``` turns on Proxy support
* ```PROXY``` - proxy server in the format ```http://server:port/```
* ```NO_PROXY_HOSTS``` - a list of hosts to never proxy, e.g. ```.cisco.com .intranet```
* ```NO_PROXY_RANGE``` - a list of /24 subnets to not proxy, e.g. 10.0.0 10.0.1
