import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  const AnimatedText({Key? key, required this.text, required this.textStyle})
      : super(key: key);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _textAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000), // Adjust duration as needed
    );
    _textAnimation =
        IntTween(begin: 0, end: widget.text.length).animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final displayText = widget.text.substring(0, _textAnimation.value);
    return Text(
      displayText,
      style: widget.textStyle,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
