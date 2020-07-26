# InstallCHW.net

# InstallNw.net
Install CamptonHillsWeather.net:

First, setup a data storage container that wraps the realtime weather data files (eg realtime.txt) into something that can be shared across multiple containers.  So run below, but only once.  If you are running multiple websites from the same weather data, this container is shared.  So optionally run below:
```
$ docker run -dit --name weather-data -v /mount/weather:/var/www/html/mount php:7.2-apache
$ docker exec -it weather-data /bin/bash     # verify that you can find realtime.txt in the directory si
```
Next clone the repository, build and run the container:
```
$ git clone https://github.com/jkozik/InstallCHW.net
$ cd InstallCHW.net
$ vi settings1.php # Already setup, but need to add password and any new API keys
$ docker build -t jkozik/chw.net .
$ docker run -dit --name chw.net-app -p 8081:80 --volumes-from weather-data jkozik/chw.net
$ docker exec -it chw.net-app /bin/bash # For troubleshooting, to get a bash prompt into the container

# to Rebuild, first stop and rm container
$ docker stop chw.net-app && docker rm chw.net-app
```
