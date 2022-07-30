import 'package:flutter/material.dart';

class IntroCard extends StatelessWidget {
  final String text;
  const IntroCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  offset: const Offset(0, 15),
                  blurRadius: 25)
            ],
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.black, width: 1)),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
