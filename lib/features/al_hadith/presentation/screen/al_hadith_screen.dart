import 'package:al_hadit_test/features/al_hadith/presentation/getx/al_hadith_controller.dart';
import 'package:al_hadit_test/features/al_hadith/presentation/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'al_hadith_body_page.dart';

class AlHadithScreen extends StatelessWidget {
  const AlHadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlHadithController>(
      builder: (state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (state.errorMessage != '') {
          return Text(state.errorMessage);
        }
        final chapterTitle = state.listOfLocalData?.chapterModelList
            .where((element) => element.title.isNotEmpty)
            .first;
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: HadithAppBar(
            title: state.listOfLocalData?.bookModelList.first.title ?? '',
            subTitle: chapterTitle?.title ?? '',
            onPressed: () {},
          ),
          body: HadithBodyPage(
            stateFromSuper: state,
          ),
        );
      },
    );
  }
}
