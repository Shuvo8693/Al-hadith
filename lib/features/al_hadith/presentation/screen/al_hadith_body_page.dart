import 'package:al_hadit_test/core/color/color_extension.dart';
import 'package:al_hadit_test/core/size/app_size.dart';
import 'package:al_hadit_test/core/widgets/screen_carpet.dart';
import 'package:al_hadit_test/features/al_hadith/data/model/hadith_model.dart';
import 'package:al_hadit_test/features/al_hadith/data/model/section_model.dart';
import 'package:al_hadit_test/features/al_hadith/presentation/getx/al_hadith_controller.dart';
import 'package:al_hadit_test/features/al_hadith/presentation/widget/chapter_tile.dart';
import 'package:al_hadit_test/features/al_hadith/presentation/widget/primary_tile.dart';
import 'package:flutter/material.dart';

class HadithBodyPage extends StatefulWidget {
  const HadithBodyPage({
    super.key,
    required AlHadithController stateFromSuper,
  }) : state = stateFromSuper;

  final AlHadithController state;

  @override
  State<HadithBodyPage> createState() => _HadithBodyPageState();
}

class _HadithBodyPageState extends State<HadithBodyPage> {
  List<dynamic> combineList = [];

  @override
  void initState() {
    super.initState();
    combineList = mergeList(widget.state.listOfLocalData!.hadithModelList,
        widget.state.listOfLocalData!.sectionModelList);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Carpet(),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.rW(context)),
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: combineList.length,
              itemBuilder: (context, index) {
                final combineItem = combineList[index];
                if (combineItem is SectionModel) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.rW(context)),
                    child: ChapterTile(
                        sectionNumber: combineItem.number,
                        sectionTitle: combineItem.title,
                        preface: combineItem.preface),
                  );
                } else if (combineItem is HadithModel) {
                  String hexColorString = combineItem.gradeColor;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.rW(context)),
                    child: PrimaryTile(
                      bookName: widget.state.listOfLocalData?.bookModelList
                              .first.title ??
                          '',
                      color: hexColorString.hexColor,
                      hadithData: combineItem,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  List<dynamic> mergeList(
      List<HadithModel> hadithModelList, List<SectionModel> sectionModelList) {
    List<dynamic> combinedList = [];

    for (SectionModel section in sectionModelList) {
      combinedList.add(section);
      final hadith = hadithModelList
          .where((hadithData) => hadithData.sectionId == section.sectionId)
          .toList();
      combinedList.addAll(hadith);
    }
    return combinedList;
  }
}
