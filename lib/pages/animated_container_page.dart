import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({
    super.key,
  });

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  bool _isBig = false;
  double _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  curve: Curves.easeOutExpo,
                  duration: const Duration(
                    seconds: 3,
                  ),
                  width: _size,
                  height: _size,
                  color: Colors.blue,
                ),
                const Text('Animatied Container'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isBig = !_isBig;
                  _size = _isBig ? 200.0 : 100.0;
                });
              },
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}
