import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double fontSize; // new property
  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    this.fontSize = 18.0, // default value is 18.0
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
        width: double.infinity,
        child: Container(
        height: 50,
    margin: const EdgeInsets.symmetric( horizontal: 50),
    decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(50),
        ),
        child:  Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,

            ),
          ),
        ),
      ),
        ),
    );
  }
}
