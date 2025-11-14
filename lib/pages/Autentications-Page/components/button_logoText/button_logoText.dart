import 'package:flutter/material.dart';

class ButtonLogotext extends StatelessWidget {
  final String tilte;
  final VoidCallback onPressed;
  final  Color backgroundColor;
  final Color color;


  const ButtonLogotext ({
    super.key,
    required this.tilte,
    required this.onPressed,
    this.color = Colors.white,
    this.backgroundColor = const Color(0xFF61983D),
  });
  @override
  
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).height * .4,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
              color: Color(0xFF61983D),
              width: 2
            )
          ),
          elevation: 4,
        ),
        child: Text(
          tilte,
          style: TextStyle(
            color:  color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1
          ),
        ),
      ),
    );
  }
}