import 'package:al_hadit_test/features/al_hadith/common/common_model.dart';

class BookModel  extends CommonModel{
  final int id;
  final String title;
  final String titleAr;
  final int numberOfHadis;
  final String abvrCode;
  final String bookName;
  final String bookDesc;

  BookModel(
      {required this.id,
      required this.title,
      required this.titleAr,
      required this.numberOfHadis,
      required this.abvrCode,
      required this.bookName,
      required this.bookDesc});

  factory BookModel.fromJson(Map<String, dynamic> data) {
    return BookModel(
      id: data['id'],
      title: data['title'],
      titleAr: data['title_ar'],
      numberOfHadis: data['number_of_hadis'],
      abvrCode: data['abvr_code'],
      bookName: data['book_name'],
      bookDesc: data['book_descr'],
    );
  }
}
