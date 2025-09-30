## Разработка локального окружения
## commit Configuraton local environment 
- настройка работы приложения, через forwarding ports для frontend:8080 и backend(task_m:5000). 
После проброса портов доступ к приложению осуществляется по http:localhost:8080. И поскольку переменная $API_URL=http://localhost:5000 - 
скрипт app.js выполняется без сбоев. Но доступ к backend есть по порту 5000
## commit Configuring reverse proxy and changing app.js
- при настройке с обратным proxy, доступ осуществляется по  http://task2.local:8080. И доступа к backend с клиента нет.
