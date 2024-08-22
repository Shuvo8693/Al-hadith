import 'package:al_hadit_test/features/al_hadith/data/model/books_model.dart';
import 'package:al_hadit_test/features/al_hadith/data/model/chapter_model.dart';
import 'package:al_hadit_test/features/al_hadith/data/model/hadith_model.dart';
import 'package:al_hadit_test/features/al_hadith/data/model/section_model.dart';

class DisplayModel {
  BookModel? book;
  ChapterModel? chapter;
  HadithModel? hadith;
  SectionModel? section;

  DisplayModel({
    this.section,
    this.chapter,
    this.hadith,
    this.book,
  });
}
