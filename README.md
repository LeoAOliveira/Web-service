# Web-service
Projeto para a disciplina de Computação Distribuída constituído de um app para iOS (desenvolvido em Swift 5 com Storyboard) e um servidor REST API (desenvolvido em Python 3 com Flask).

### iOS app
O app é uma interface simples para interagir com o server (representa o lado do client). Ele realiza requisições no server (chamadas de API) e atualiza a interface conforme recebe os dados.

### Python server
O server consiste em um aplication e um model. O application constroi o server e o disponibiliza, juntamente com as rotas de acesso a REST API (com Flask). O model possui os objetos do server, inspirados no padrão GoF Compositen.
