import 'dart:math';

import 'package:flutter/material.dart';
import './widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyWidget());
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _frontAnimation;
  late Animation<double> _backAnimation;
  bool isFrontVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _setupAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setupAnimation() {
    bool rotateToLeft = isFrontVisible;
    _frontAnimation = TweenSequence<double>([
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.0, end: rotateToLeft ? (pi / 2) : (-pi / 2)).chain(CurveTween(curve: Curves.linear)), weight: 50),
      TweenSequenceItem(tween: ConstantTween<double>(rotateToLeft ? (-pi / 2) : (pi / 2)), weight: 50)
    ]).animate(_controller);

    _backAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween<double>(rotateToLeft ? (pi / 2) : (-pi / 2)), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: rotateToLeft ? (-pi / 2) : (pi / 2), end: 0).chain(CurveTween(curve: Curves.linear)), weight: 50)
    ]).animate(_controller);
  }

  void flipCard() {
    setState(() {
      if (isFrontVisible) {
        _controller.forward();
        isFrontVisible = false;
      } else {
        _controller.reverse();
        isFrontVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Animation test'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: flipCard,
              child: Stack(
                children: [
                  CardAnimationWidget(
                    animation: _backAnimation,
                    child: const CardBackWidget(),
                  ),
                  CardAnimationWidget(
                    animation: _frontAnimation,
                    child: const CardFrontWidget(),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: flipCard,
              child: const Text('Virar'),
            )
          ],
        ),
      ),
    );
  }
}
