import 'package:al_hadit_test/features/al_hadith/common/common_model.dart';

class HadithModel  extends CommonModel{
  final int hadithId;
  final int bookId;
  final String bookName;
  final int chapterId;
  final int sectionId;
  final String narrator;
  final String bn;
  final String ar;
  final String arDiacless;
  final String note;
  final int gradeId;
  final String grade;
  final String gradeColor;

  HadithModel(
      {required this.hadithId,
      required this.bookId,
      required this.bookName,
      required this.chapterId,
      required this.sectionId,
      required this.narrator,
      required this.bn,
      required this.ar,
      required this.arDiacless,
      required this.note,
      required this.gradeId,
      required this.grade,
      required this.gradeColor});

  factory HadithModel.fromJson(Map<String,dynamic> data){
    return HadithModel(
        hadithId: data['hadith_id'] ,
        bookId: data['book_id'],
        bookName: data['book_name'],
        chapterId: data['chapter_id'],
        sectionId: data['section_id'],
        narrator: data['narrator'],
        bn: data['bn'],
        ar: data['ar'],
        arDiacless: data['ar_diacless'],
        note: data['note'],
        gradeId: data['grade_id'],
        grade: data['grade'],
        gradeColor: data['grade_color'],
    );
  }
}
