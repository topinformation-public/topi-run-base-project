# Projeto Base Topi Run 2021
----
Após ter clonado esse repositório, vc pode mescla-lo com o seu projeto.

Ele já te fornece uma estrutura básica, com alguns pontos que vimos em aula.

Para enviar as classes do projeto para sua Org Salesforce vc pode executar o comando abaixo no command do DOS

# Instalação
--------


``` bash

sfdx force:auth:web:login -a my-sandbox --instanceurl https://login.salesforce.com

sfdx force:source:deploy -p ./force-app/main/default -u my-sandbox --wait=90

```
**PS:** `my-sandbox` é o apelido que vc quer dar para sua Org Salesforce


Após isso basta abrir o vscode na pasta topi-run-base-project e ele já reconhecerá que é um projeto Salesforce.

Após isso base executar o CTRL + SHIFT + P > "SFDX: Authorize an Org"

