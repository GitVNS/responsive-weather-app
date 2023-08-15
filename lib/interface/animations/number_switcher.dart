import 'package:flutter/material.dart';

class NumberSwitcher extends StatefulWidget {
  const NumberSwitcher(
      {super.key,
      required this.start,
      required this.end,
      required this.duration,
      this.appendText = '',
      required this.textStyle});

  final double start;
  final double end;
  final Duration duration;
  final String appendText;
  final TextStyle textStyle;

  @override
  State<NumberSwitcher> createState() => _NumberSwitcherState();
}

class _NumberSwitcherState extends State<NumberSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationNumber;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration)..forward();
    _animationNumber = Tween<double>(begin: widget.start, end: widget.end)
        .animate(CurvedAnimation(
            curve: Curves.linear, parent: _animationController));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationNumber,
      builder: (context, child) {
        return Text(
          "${_animationNumber.value.toInt().toString()}${widget.appendText}",
          style: widget.textStyle,
        );
      },
    );
  }
}
