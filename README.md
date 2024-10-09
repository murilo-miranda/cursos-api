# Projeto

Aplicacao API voltada para gerenciamento de cursos.

Obs: Projeto em conjunto com repositorio https://github.com/murilo-miranda/cursos-web

## Api

Este repositório contém um projeto rails apenas com API que serve como back-end. É aqui que são gerenciados o banco de dados e os endpoints da aplicação 

Status: **Em desenvolvimento**

## Requisitos mínimos

Para rodar este projeto, é necessário que você possua o Docker instalado na máquina que será utilizada. Caso ainda não possua, você pode seguir as instruções da documentação oficial para fazer a instalação:

[Docker-Desktop](https://www.docker.com/products/docker-desktop/)
 
### Instruções de como rodar o projeto

- Primeiro clone o repositório do projeto com o seguinte comando:

    `git@github.com:murilo-miranda/cursos-api.git`

- Monte a imagem do projeto 

    `docker build .`

- Suba os containeres necessários para o funcionamento da app

    `docker compose up -d`

- Acessar container e executar comandos:

  `docker ps`

  - Obter o CONTAINER ID

  `docker exec -it CONTAINER_ID bash`

  - Acessa container

  `rspec`

  - Roda os testes

### Endpoints

#### `POST /course`
  
  Cria detalhes de um curso, com retorno 201 e body:

  ```json
    {}
  ```

  Nao cria detalhes de um curso, com retorno 400 e body:

   ```json
    {"param is missing or the value is empty": "attribute"}
  ```

#### `GET /course`

  Retorna uma lista de cursos, com retorno 200 e body:

  ```json
    {
      "data": [
        {
          "id": "1",
          "type": "course",
          "attributes": {
            "title": "Novo Curso Rails",
            "description": "Curso basico de ruby on rails",
            "end_date": "2024-10-10T00:00:00.000Z"
          }
        },
        {
          "id": "2",
          "type": "course",
          "attributes": {
            "title": "Matematica",
            "description": "Curso voltado a matematica",
            "end_date": "2024-10-10T00:00:00.000Z"
          }
        }
      ]
    }
  ```

#### `PUT /course/:id`

  Edita as informacoes de um curso, com retorno 200 e body:

  ```json
    {
      "data": {
        "id": "1",
        "type": "course",
        "attributes": {
          "title": "new title",
          "description": "new description",
          "end_date": "2025-10-01T00:00:00.000Z"
        }
      }
    }
  ```

  Nao edita as informacoes de um curso, com retorno 404 e body:

  ```json
    {"Couldn't find Course with 'id'": "id"}
  ```

#### `DELETE /course/:id`
  
  Deleta um curso baseado em seu identificador, com retorno 204 e sem body.

  Nao deleta um curso baseado em seu identificador, com retorno 404 e body:

  ```json
    {"Couldn't find Course with 'id'": "id"}
  ```

