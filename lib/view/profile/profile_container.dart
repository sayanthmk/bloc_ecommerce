import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text;

  const CustomContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      height: 70,
      width: 350,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
