# izifood

## Um projeto Flutter para um teste na IziFood

# Do projeto
- Uso do GetX(https://pub.dev/packages/get)
- Uso de Repository Pattern
- Uso da Api do JsonPlaceholder(https://jsonplaceholder.typicode.com)

# Da estrutura
<a href="https://imgbb.com/"><img src="https://i.ibb.co/bv0ngXt/Captura-de-Tela-2020-11-08-s-18-06-31.png" alt="Captura-de-Tela-2020-11-08-s-18-06-31" border="0"></a>

- app
    - Dentro de app teremos todo o codigo do aplicativo separado por diretorios onde terão arquivos com classes se Single Responsability
- api 
    - Dentro de api teremos todas as requisições aos dados da web, um arquivo para a requisição de posts e um arquivo para a requisição de comentários
- bindings
    - O GetX usa os bindings para iniciar as requisições dos dados a api, dentro do binding se iniciam os controllers
- controllers
    - Dentro dos controllers chamamos o repositório e criamos o get e set para a variável que vai receber o conteúdo da requisição, dentro dos controllers temos também um arquivo chamao keys que recebe todas as constantes que serão reutilizadas no projeto
- models 
    - Em models estamos criando a classe com as variáveis que virão como resposta da requisição e os métodos para converter o corpo do Json para String ou int
- pages
    - Dentro de pages temos todos os arquivos de interface e um diretório de widgets que são reutilizados ou que são muito grandes para incorporar no código, widgets que se deixasse nos arquivos de page ocupariam muito espaço deixando o código quase que ilegível
- repositories
    - O diretório repositories se conecta a requisição da api e guarda todos os dados recebidos numa variável dentro de uma função para organizar melhor o código

- ** EXTRA **
    - Para fazer a requisição dos comentários do post correto foi-se instanciado o id do post dentro do shared preferences que guarda a variável dentor da memória do celular e todas as vezes que sai da tela de comentários o GetX automaticamente apaga esse valor para que quando for requisitado novos comentários e instanciado um novo valor na variável não venha a existir conflito de valores
    - Para passar o título e corpo do post foi-se enviado por argumentos de uma classe para a outra

## Atenciosamente RodriguesJeff Dev