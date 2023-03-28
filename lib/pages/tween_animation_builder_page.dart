import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  const TweenAnimationBuilderPage({
    super.key,
  });

  @override
  State<TweenAnimationBuilderPage> createState() =>
      _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {
  final double _size = 100.0;

  final Tween<double> _animationTween = Tween(begin: 0, end: 2 * pi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TweenAnimationBuilderPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: _animationTween,
              duration: const Duration(seconds: 2),
              builder: (context, value, child) {
                return Transform.rotate(
                  angle: value,
                  child: child,
                );
              },
              child: Container(
                color: Colors.blue,
                width: _size,
                height: _size,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}
