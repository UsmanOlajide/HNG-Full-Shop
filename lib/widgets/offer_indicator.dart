import 'package:flutter/material.dart';
import 'package:hype_kicks/utils/colors.dart';

class OfferIndicator extends StatelessWidget {
  const OfferIndicator({super.key, required this.isCurrentItem});

  final indicatorHeight = 8.0;
  final bool isCurrentItem;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCirc,
      height: indicatorHeight,
      width: indicatorHeight,
      decoration: BoxDecoration(
        color: isCurrentItem ? Colors.white : secondary800,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
