#!/bin/bash
sudo apt-get update --fix-missing
sudo apt-get install default-jdk nginx -y

git clone https://github.com/AAU-WeatherReporterProject/WeatherReporterBackend.git
git clone https://github.com/AAU-WeatherReporterProject/FrontendWebsite.git

mv WeatherReporterBackend/src/main/java/at/aau/projects/weatherreporter/rest/jar/weather-reporter-0.0.1-SNAPSHOT.jar ./

sudo /usr/bin/java -jar weather-reporter-0.0.1-SNAPSHOT.jar

