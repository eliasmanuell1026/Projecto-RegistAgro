import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: indexpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class indexpage extends StatefulWidget{
  const indexpage({super.key});

  @override
  State<indexpage> createState() => _indexpage();
}

class _indexpage extends State<indexpage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
       child:  Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .08,),
            Container(
              height: MediaQuery.sizeOf(context).height * .2,
              child: Image(
                image: AssetImage('images/icons/RegistIcon.png'),
              ),
            ),
            Text("RegistAgro", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),),
            SizedBox(height:  MediaQuery.sizeOf(context).height * .0,),
            Text("Seu mercado de confiaça para \n produtos frescos e locais", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 17),),
            SizedBox(height: MediaQuery.sizeOf(context).height * .3,),
            Container(
              child: Column(
                children: [
                  Container(
                        child: MaterialButton(
                          minWidth: MediaQuery.sizeOf(context).width * .9,
                          height: 50,
                          onPressed: () => {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)
                          ),
                          color: const Color.fromARGB(255, 3, 172, 11),
                          child: Text(
                            "Entrar",
                            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * .02,),
            Container(
              child: Column(
                children: [
                  Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: MaterialButton(
                          minWidth: MediaQuery.sizeOf(context).width * .9,
                          height: 50,
                          onPressed: () => {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),                            
                          ),
                          color: const Color.fromARGB(255, 248, 250, 248),
                          
                          child: Text(
                            "Entrar",
                            style: TextStyle(color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                ],
              ),
            )
          ],
        ),
      ),
      )
    );
  }
}