import 'package:flutter/material.dart';
import 'package:projecto_registagro/pages/Autentications-Page/components/button_logoText/button_logoText.dart';


class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage("assets/images/icone.png"),
          height: 200.0,
          width: 200.0,
          fit: BoxFit.cover,

        ),
        Text(
          "RegistAgro",
          style: TextStyle(
            color: Color.fromARGB(255, 110, 173, 68),
            fontSize: 25,
            fontWeight: FontWeight.bold
            ),
        ),
        SizedBox(height: 10,),
        Text(
          "Seu mercado de confiança para \nprodutos frescos e locais",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[300]
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .08,),
        // Image.asset(
        //   "assets/images/avatar.gif",
        //   height: 150,
        //   width: 140,
        //   fit: BoxFit.cover,
        // ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .3,),
        ButtonLogotext(
          tilte: "Entrar",
          onPressed: () => {print("Entrou")},
        ),
        SizedBox(height: 10,),
        ButtonLogotext(
          tilte: "Criar conta",
          color: Color(0xFF61983D),
          backgroundColor: Colors.transparent,
          onPressed: () => {print("Criou")},
        )

      ],
    );
  }
}