import 'package:al_hadit_test/features/al_hadith/common/common_model.dart';

class SectionModel  extends CommonModel{
  final int id;
  final int bookId;
  final String bookName;
  final int chapterId;
  final int sectionId;
  final String title;
  final String preface;
  final String number;

  SectionModel(
      {required this.id,
      required this.bookId,
      required this.bookName,
      required this.chapterId,
      required this.sectionId,
      required this.title,
      required this.preface,
      required this.number});

  factory SectionModel.fromJson(Map<String,dynamic>data){
    return SectionModel(
        id: data['id'] ,
        bookId: data['book_id'],
        bookName: data['book_name'],
        chapterId:data['chapter_id'] ,
        sectionId: data['section_id'],
        title: data['title'],
        preface: data['preface'],
        number: data['number'],
    );
  }
}
