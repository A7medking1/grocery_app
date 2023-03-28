import 'package:flutter/material.dart';

class IndicatorPageView extends StatelessWidget {
  final int currentIndex;

  const IndicatorPageView({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: Opacity(
            opacity: currentIndex == index ? 1 : 0.4,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: index == currentIndex
                  ? Colors.green
                  : Colors.black.withOpacity(0.2),
              child: const CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        );
      }),
    );
  }
}
