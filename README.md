# Overview
Container contains node, and java17 with chrome accessible via novnc

## Installation
- ### Manual
    ```sh
    docker run \
        --name chrome-novnc \
        -e PORT=8080 \
        -p 8080:8080 \
        -d quantummecha/chrome-novnc:latest
    ```

## Environment variables:
|VARIABLE      |DESCRIPTION                |DEFAULT VALUE  |
|-------------:|:--------------------------|:-------------:|
|PORT          |NoVNC HTTPS Port           |               |
|APP_NAME 	   |Name of the app            |               |
|CHROME_URL    |Starting page for Chromium |               |
