import 'package:flutter/material.dart';

class CardBackWidget extends StatelessWidget {
  const CardBackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .9,
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueAccent,
      ),
      child: const Center(child: Text('POSTERIOR')),
    );
  }
}
