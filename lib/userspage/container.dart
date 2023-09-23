import 'package:flutter/material.dart';
class ContainerWithText extends StatelessWidget {
  final Color color;
  final String text;
  final String Num;
  ContainerWithText({required this.color, required this.text, required this.Num,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 70,
      color: color,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 5,),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(Num,style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),)
          ],
        ),
      ),
    );
  }
}





