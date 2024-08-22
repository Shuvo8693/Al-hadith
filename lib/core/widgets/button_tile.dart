import 'package:al_hadit_test/core/text_style/app_text_style.dart';
import 'package:flutter/material.dart';

class ButtonTile extends StatelessWidget {
  const ButtonTile({
    super.key,
    required this.grade,
    required this.onTab,
    required this.color,
  });

  final String grade;
  final Function() onTab;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            grade,
            style: AppTextStyle.mediumS12(),
          ),
        )),
      ),
    );
  }
}
