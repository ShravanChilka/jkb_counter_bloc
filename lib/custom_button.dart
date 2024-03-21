import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  Container(
        width: 300,
        height: 300,
        alignment: Alignment.center,
        color: Colors.pinkAccent,
        child: Text(title),
      ),
    );
  }
}
