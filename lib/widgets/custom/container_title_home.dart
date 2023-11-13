import 'package:flutter/material.dart';

class CustomContainerTitle extends StatelessWidget {
  final String title;
  const CustomContainerTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blueGrey,
        gradient: const LinearGradient(
            colors: [Colors.amber, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        boxShadow: const [
          BoxShadow(
            color: Colors.red,
            offset: Offset(10, 5),
            blurRadius: 20,
          )
        ],
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
