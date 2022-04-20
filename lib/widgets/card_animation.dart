import 'package:flutter/material.dart';

class CardAnimationWidget extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  const CardAnimationWidget({
    Key? key,
    required this.animation,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? childd) {
        final Matrix4 transform = Matrix4.identity();
        transform.rotateY(animation.value);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: childd,
        );
      },
      child: child,
    );
  }
}
