import 'package:flutter/material.dart';

class CardFrontWidget extends StatelessWidget {
  const CardFrontWidget({Key? key}) : super(key: key);

  final text = 'O que é Transconstitucionalismo (ou constitucionalismo cruzado)?';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .9,
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(child: Text(text, textAlign: TextAlign.justify, style: const TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
