# NASA APOD Flutter App 🚀

Este aplicativo Flutter consome a API Astronomy Picture of the Day (APOD) da NASA, exibindo diariamente uma imagem astronômica com descrição detalhada.

## Funcionalidades 🌟

- **Lista de Imagens**: Visualize uma lista de imagens diárias da NASA.
- **Detalhes da Imagem**: Toque para ver uma explicação detalhada da imagem.
- **Atualização com Pull-to-Refresh**: Atualize a lista arrastando para baixo.
- **Busca**: Filtre imagens por título ou data.
- **Armazenamento em Cache**: As imagens são armazenadas localmente para acesso offline.
- **Tratamento de Erros de Imagem**: Mostra uma imagem padrão quando não é possível carregar a imagem original.

## Tecnologias Utilizadas 🛠️

- **Flutter**: Framework de desenvolvimento do aplicativo.
- **Hive**: Armazenamento local para dados persistentes.
- **HTTP**: Para chamadas de rede.

## Estrutura do Projeto 📂

- **`main.dart`**: Inicializa o aplicativo e configura o tema.
- **`ApiService`**: Responsável por buscar dados da API e gerenciar o cache.
- **`ApodListScreen`**: Tela principal que exibe a lista de imagens.
- **`ApodDetailScreen`**: Tela que exibe os detalhes de uma imagem específica.
- **`apod_model.dart`**: Modelo de dados para as imagens do dia.

## Pré-requisitos 📋

- Flutter SDK
- Dart SDK
