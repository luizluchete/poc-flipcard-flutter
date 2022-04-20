import 'package:flutter/material.dart';

class CardBackWidget extends StatelessWidget {
  const CardBackWidget({Key? key}) : super(key: key);

  final text =
      'De acordo com o professor Marcelo Neves, é o fenômeno em que uma mesma situação concreta ou um mesmo tema são discutidos simultaneamente em foros internos, internacionais e supranacionais. Representa a possibilidade de o Estado resolver seus problemas internos com base em soluções que foram encontradas por juízes de outros Estados ou de instâncias supralegais.';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .9,
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
        color: Colors.white,
      ),
      child: Center(child: Text(text, textAlign: TextAlign.justify)),
    );
  }
}
