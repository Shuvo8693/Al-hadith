import 'package:al_hadit_test/core/size/app_size.dart';
import 'package:al_hadit_test/core/widgets/space.dart';
import 'package:flutter/material.dart';

class ChapterTile extends StatelessWidget {
  const ChapterTile({
    super.key,
    required this.sectionNumber,
    required this.sectionTitle,
    required this.preface,
  });

  final String sectionNumber;
  final String sectionTitle;
  final String preface;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        width: 400.rW(context),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sectionNumber),
                  horizontalSpacing(5),
                  SizedBox(
                    width: 260.rW(context),
                    child: Text(
                      sectionTitle,
                    ),
                  ),
                ],
              ),
              verticalSpacing(8.rH(context)),
              const Divider(height: 1),
              verticalSpacing(8.rH(context)),
              SizedBox(
                width: 380.rW(context),
                child: Text(
                  preface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
