# Instalation




### [Download](https://github.com/patarakaci/Upload.Drive.Api/releases/download/curl-v1.0/bash_driver_api.tar.gz) bash scripts and follow guide!
---

- Enter to Google console -> [link](https://console.cloud.google.com/)

- Choose Credentials -> Create Project
![Choose Credentials -> Create Project](./README/1.png)
![Create Project](./README/2.png)




- Create Credentials -> OAuth client ID
![Create Credentials -> OAuth client ID](./README/3.png)




- Choose Configure Consent Screen -> Choose External
![Choose Configure Consent Screen](./README/4.png)
![Choose External](./README/5.png)




- Enter next values: App name; User support email; Email addresses. -> Save and continue

    ![Enter next values: App name; User support email; Email addresses. -> Save and continue](./README/6.png)



- Choose Add or remove scopes and mark all API-s (it is necessary ) -> Save and continue -> Save and continue -> Back to dashboard
![Choose Add or remove scopes and mark all API-s (it is necessary ) -> Save and continue -> Save and continue -> Back to dashboard](./README/7.png)


- Choose Credentials -> Create Credentials -> OAuth client ID -> choose "TVs and Limited Input Devices" -> Create

    ![Choose Credentials -> Create Credentials -> OAuth client ID -> choose "TVs and Limited Input Devices" -> Create](./README/8.png)

- On same [link](https://console.developers.google.com/) Choose Enabled APIs and Services -> ENABLE APIS AND SERVICES
![Drive API](./README/10.png)

- Search Google Driver API -> Enable

    ![- Search Google Driver API -> Enable](./README/11.png)

---
# Usage
- run firstly main_api_upload.sh script.
    ```bash
    bash /path/main_api_upload.sh
    ```
- input Client ID and Client Secret

    ![script](./README/12.png) 
- visit [Google device link](https://www.google.com/device) and input User Code which is outputed by script
- command to make cronjob
    ```bash
    crontab -e
    ``` 
- then write bellow command to crontab for refresh token in every 15 minuntes!
    ```
    */15 * * * * bash /path/refresh_token.sh
    ```
- last step is run updated mysqldbdump-bash.sh script