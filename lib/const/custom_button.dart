import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({Key? key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      child: ElevatedButton(
       child: Text(text,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),
       ),
       onPressed:onPressed,
       style: ElevatedButton.styleFrom(
        primary: Color(0XFFF89818),
       ),
      ),
    );
  }
}