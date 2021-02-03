#bin/bash
sudo apt-get install default-jdk nginx -y

git clone https://github.com/AAU-WeatherReporterProject/WeatherReporterBackend.git
git clone https://github.com/AAU-WeatherReporterProject/FrontendWebsite.git

mv WeatherReporterBackend/src/main/java/at/aau/projects/weatherreporter/rest/jar/weather-reporter-0.0.1-SNAPSHOT.jar ./

sudo cat > /etc/systemd/system/WeatherBackendService.service << EOF
[Unit]
Description=WeatherReporterBackend automated daemon-service
[Service]
User=ubuntu
# application.properties

# Workspace
WorkingDirectory=/home/ubuntu/AWSDeploy

# Executable
ExecStart=/home/ubuntu/AWSDeploy/WeatherBackendService.conf

SuccessExitStatus=143
TimeoutStopSec=10
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo cat > /home/ubuntu/AWSDeploy/WeatherBackendService.conf << EOF
#!/bin/sh
sudo java -jar weather-reporter-0.0.1-SNAPSHOT.jar 
EOF

sudo chmod u+x WeatherBackendService.conf

sudo systemctl daemon-reload
sudo systemctl enable WeatherBackendService.service
sudo systemctl start WeatherBackendService
sudo systemctl status WeatherBackendService
