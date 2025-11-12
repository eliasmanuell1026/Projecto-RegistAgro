
class Onboardinglist {
  String title;
  String description;
  String imagePath;
  Onboardinglist(
      {required this.title, required this.description, required this.imagePath}
    );
}
final List<Map<String, String>> onboardingPages = [
    {
      "title": "Welcome to RegistAgro",
      "description":
          "Seu mercado de confiança para \nprodutos frescos e locais",
      "imagePath": "images/icone.png"
    },
    {
      "title": "Conecte o campo à sua mesa",
      "description":
          "A RegistAgro aproxima produtores e consumidores de forma fácil e digital.",
      "imagePath": "images/campoPlantacao.jpeg"
    },
    {
      "title": "Registre-se e gira a sua produção",
      "description":
          "Organize suas colheitas, controle estoques \ne acompanhe seu rendimento.",
      "imagePath": "images/gado.jpeg"
      
    },
    {
      "title": "Transporte eficiente e seguro",
      "description":
          "Conectamos produtores a transportadoras \nde forma rápida e segura.",
      "imagePath": "images/transportando.jpeg"
    },
    {
      "title": "Transparencia e confiança",
      "description":
          "A RegistAgro aproxima produtores e \nconsumidores de forma fácil e digital.",
      "imagePath": "images/campoAlface.jpeg"
    },
];