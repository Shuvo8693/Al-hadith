import 'package:al_hadit_test/features/al_hadith/common/common_model.dart';

class ChapterModel  extends CommonModel{
  final int id;
  final int chapterId;
  final int bookId;
  final String title;
  final int number;
  final String hadisRange;
  final String bookName;

  ChapterModel(
      {required this.id,
      required this.chapterId,
      required this.bookId,
      required this.title,
      required this.number,
      required this.hadisRange,
      required this.bookName});

  factory ChapterModel.fromJson( Map<String,dynamic> data){
     return ChapterModel(
         id: data['id'],
         chapterId:  data['chapter_id'],
         bookId:  data['book_id'],
         title:  data['title'],
         number: data['number'],
         hadisRange:  data['hadis_range'],
         bookName:  data['book_name'],
     );
  }
}
