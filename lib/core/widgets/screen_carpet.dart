import 'package:al_hadit_test/core/color/app_colors.dart';
import 'package:al_hadit_test/core/size/app_size.dart';
import 'package:al_hadit_test/features/al_hadith/presentation/widget/appbar.dart';
import 'package:flutter/material.dart';

class Carpet extends StatelessWidget {
  const Carpet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration:  BoxDecoration(
            color: AppColors.whiteSmoke,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.rP(context)),
                topRight: Radius.circular(15.rP(context)))),
      );

  }
}