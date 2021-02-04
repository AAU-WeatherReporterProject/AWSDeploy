#!/bin/bash
sudo apt-get update --fix-missing
sudo apt-get install default-jdk nginx -y

git clone https://github.com/AAU-WeatherReporterProject/WeatherReporterBackend.git
git clone https://github.com/AAU-WeatherReporterProject/FrontendWebsite.git

sudo mv FrontendWebsite/ /var/www/html/
sudo sed -i 's,/var/www/html,/var/www/html/FrontendWebsite/target/dist,g' /etc/nginx/sites-available/default
sudo sed -i 's,/var/www/html/var/www/html/FrontendWebsite/target/dist/var/www/html/FrontendWebsite/target/dist,/var/www/html/FrontendWebsite/target/dist,g' /etc/nginx/sites-available/default
sudo systemctl restart nginx

sudo mv WeatherReporterBackend/src/main/java/at/aau/projects/weatherreporter/rest/jar/weather-reporter-0.0.1-SNAPSHOT.jar ./
sudo /usr/bin/java -jar weather-reporter-0.0.1-SNAPSHOT.jar

