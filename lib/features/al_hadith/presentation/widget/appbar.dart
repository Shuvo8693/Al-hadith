import 'package:al_hadit_test/core/color/app_colors.dart';
import 'package:al_hadit_test/core/size/app_size.dart';
import 'package:al_hadit_test/core/text_style/app_text_style.dart';
import 'package:al_hadit_test/core/widgets/space.dart';
import 'package:flutter/material.dart';

class HadithAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HadithAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String title;
  final String subTitle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      toolbarHeight: 100.rH(context),
      leading: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          )),
      title: Column(
        children: [
          Text(
            title,
            style: AppTextStyle.boldS14(),
          ),
          verticalSpacing(5),
          Text(
            subTitle,
            style: AppTextStyle.mediumS12().copyWith(color: Colors.white60),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
