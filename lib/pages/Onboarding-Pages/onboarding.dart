import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:projecto_registagro/Models/onboardingLinst.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projecto_registagro/pages/Autentications-Page/homeScreen/homescreen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.grey[200]!,
        showSkipButton: true,
        skip: Text("Skip", style: TextStyle( color: Color(0xFF61983D), fontSize: 18, fontWeight: FontWeight.bold),),
        next: Icon(Icons.arrow_forward, 
          color: Color(0xFF61983D),
          size: 24,
          fontWeight: FontWeight.bold,
        ),
        done: Text("Done", style: TextStyle(color: Color(0xFF61983D) ,fontWeight: FontWeight.w600, fontSize: 18)),
        onDone: () {
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: Homescreen(),
              duration: Duration(milliseconds: 350)
            ) 
          
          );
        } ,
        dotsDecorator: DotsDecorator(
          size: const Size(10.0, 10.0),
          color: Colors.grey, 
          activeSize: const Size(25.20, 10.0),
          activeColor: Color(0xFF61983D),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0), // deixa a barra arredondada
          ),
        ),
        pages: [
          for(var Onboardinglist in onboardingPages)
          PageViewModel(
            titleWidget: const SizedBox.shrink(),
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 130,),
                Text(
                Onboardinglist['title'] ?? "", 
                style: TextStyle(
                  color: Color(0xFF61983D),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
               ),
               SizedBox(height: 20),
                Text(Onboardinglist[
                  'description'] ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: AssetImage(
                      Onboardinglist["imagePath"] ?? "assets/images/icone.png",
                    ),
                    height: 300.0,
                    width: 300.0,
                    fit: BoxFit.cover,
                ),
                )
              ],
            ),
             
              ),
            ])
            );
  }
}