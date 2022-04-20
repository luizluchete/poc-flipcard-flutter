import 'package:flutter/material.dart';

class CardFrontWidget extends StatelessWidget {
  const CardFrontWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .9,
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellowAccent,
      ),
      child: const Center(child: Text('FRONTAL')),
    );
  }
}
