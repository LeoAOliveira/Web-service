# Web-service
Projeto para a disciplina de Computação Distribuída constituído de um app para iOS (desenvolvido em Swift 5 com Storyboard) e um server com REST API (desenvolvido em Python 3 com Flask).

![alt text](https://github.com/LeoAOliveira/Web-service/blob/develop/iOS%20App/Automobile/Automobile/Assets.xcassets/AppIcon.appiconset/Icon-60%403x.png?raw=true)

### iOS app - Automobile
O Automobile é um app de gerência de loja de carros, em que é possível consultar os produtos, adicionar um novo produto ou buscar um produto pelo seu código. O app é uma interface simples para interagir com o server (representa o lado do client), onde todas as funções são realizadas. O app em Swift realiza requisições no server (chamadas de API) e atualiza a interface conforme recebe os dados.

### Python server
O server possui os dados do projeto e opera com eles. O server consiste em um aplication.py e um model.py. O application.py constroi o server e o disponibiliza, juntamente com as rotas de acesso a REST API (com Flask). O model.py possui os objetos do server (inspirados no padrão GoF Compositen) e seus métodos.
