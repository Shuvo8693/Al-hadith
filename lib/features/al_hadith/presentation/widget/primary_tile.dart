import 'package:al_hadit_test/core/color/app_colors.dart';
import 'package:al_hadit_test/core/size/app_size.dart';
import 'package:al_hadit_test/core/text_style/app_text_style.dart';
import 'package:al_hadit_test/core/widgets/button_tile.dart';
import 'package:al_hadit_test/core/widgets/space.dart';
import 'package:al_hadit_test/features/al_hadith/data/model/hadith_model.dart';
import 'package:flutter/material.dart';

class PrimaryTile extends StatelessWidget {
  const PrimaryTile(
      {super.key,
      required this.color,
      required this.bookName,
      required this.hadithData});

  final Color color;
  final String bookName;
  final HadithModel hadithData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: 400.rW(context),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.rP(context)),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0.rP(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Container(
                        height: 55.rH(context),
                        width: 55.rH(context),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15.rP(context))),
                        child: Center(
                            child: Text(
                          'B',
                          style: AppTextStyle.boldS14(),
                        )),
                      ),
                      horizontalSpacing(10),
                      Column(
                        children: [
                          Text(bookName), //bookName
                          verticalSpacing(6.rH(context)),
                          Text('Hadis : ${hadithData.hadithId}'), //hadisNo
                        ],
                      ),
                    ],
                  ),
                  ButtonTile(
                    grade: hadithData.grade, //grade
                    onTab: () {},
                    color: color,
                  )
                ],
              ),
              verticalSpacing(10.rH(context)),
              Text(
                hadithData.ar,
                textAlign: TextAlign.right,
              ), //ar

              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.rH(context)),
                child: Text(
                  hadithData.narrator, //narrator
                  style: AppTextStyle.mediumS12()
                      .copyWith(color: AppColors.greenyBlue),
                ),
              ),

              Text(hadithData.bn), //bn
              hadithData.note.isEmpty || hadithData.note == ''
                  ? const SizedBox.shrink()
                  : Wrap(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        verticalSpacing(6.rH(context)),
                        const Text('FootNote'),
                        verticalSpacing(5),
                        Text(hadithData.note) //note
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
