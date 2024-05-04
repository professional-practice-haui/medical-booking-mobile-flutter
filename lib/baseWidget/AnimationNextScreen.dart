import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AnimationNextScreen extends StatefulWidget {
  const AnimationNextScreen({super.key});

  @override
  State<AnimationNextScreen> createState() => _AnimationNextScreenState();
}

class _AnimationNextScreenState extends State<AnimationNextScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: LoadingAnimationWidget.flickr(
        leftDotColor: const Color(0xFF1A1A3F),
        rightDotColor: const Color(0xFFEA3799),
        size: 40,
      ),
    );
  }
}
