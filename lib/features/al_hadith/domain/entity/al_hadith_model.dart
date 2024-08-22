import 'package:al_hadit_test/features/al_hadith/data/datasource/local_data_source.dart';

class AlHadithModel {
  final String? bookTitle;
  final String? bookTitleAr;
  final int? bookNumberOfHadis;
  final String? bookAbvrCode;
  final String? bookDesc;

  final String? chapterTitle;
  final int? chapterNumber;
  final String? chapterHadisRange;

  final int? hadithId;
  final int ?hadithBookId;
  final String? hadithBookName;
  final int? hadithChapterId;
  final int? hadithSectionId;
  final String? narrator;
  final String? bn;
  final String? ar;
  final String? arDiacless;
  final String? note;
  final int? gradeId;
  final String? grade;
  final String? gradeColor;

  final int? sectionChapterId;
  final int? sectionId;
  final String? sectionTitle;
  final String? sectionPreface;
  final String? sectionNumber;

  AlHadithModel(
      { this.bookTitle,
       this.bookTitleAr,
       this.bookNumberOfHadis,
       this.bookAbvrCode,
       this.bookDesc,

       this.chapterTitle,
       this.chapterNumber,
       this.chapterHadisRange,

       this.hadithId,
       this.hadithBookId,
       this.hadithBookName,
       this.hadithChapterId,
       this.hadithSectionId,
       this.narrator,
       this.bn,
       this.ar,
       this.arDiacless,
       this.note,
       this.gradeId,
       this.grade,
       this.gradeColor,

       this.sectionChapterId,
       this.sectionId,
       this.sectionTitle,
       this.sectionPreface,
       this.sectionNumber});


  static List<AlHadithModel> fromLocalSource(ListOfLocalData data){
    List<AlHadithModel> combinedAllList = [];
    combinedAllList.addAll(data.bookModelList.map((book){
      return AlHadithModel(
        bookTitle: book.title ,
        bookTitleAr: book.titleAr,
        bookNumberOfHadis: book.numberOfHadis,
        bookAbvrCode: book.abvrCode,
        bookDesc: book.bookDesc,
      );
    }));

    combinedAllList.addAll(data.chapterModelList.map((chapter){
      return AlHadithModel(
      chapterTitle: chapter.title,
        chapterNumber: chapter.number,
        chapterHadisRange: chapter.hadisRange,
      );
    }));

    combinedAllList.addAll(data.hadithModelList.map((hadith){
      return AlHadithModel(
        hadithId: hadith.hadithId,
        hadithBookId: hadith.bookId,
        hadithBookName: hadith.bookName,
        hadithChapterId: hadith.chapterId,
        hadithSectionId: hadith.sectionId,
        narrator: hadith.narrator,
        bn: hadith.bn,
        ar: hadith.ar,
        arDiacless: hadith.arDiacless,
        note: hadith.note,
        gradeId: hadith.gradeId,
        grade: hadith.grade,
        gradeColor: hadith.gradeColor,
      );
    }));

    combinedAllList.addAll(data.sectionModelList.map((section){
      return AlHadithModel(
        sectionChapterId:section.chapterId,
        sectionId: section.sectionId,
        sectionTitle: section.title,
        sectionPreface: section.preface,
        sectionNumber:section.number,
      );
    }));

    return combinedAllList;
  }
}
