import 'package:al_hadit_test/features/al_hadith/data/datasource/local_data_source.dart';
import 'package:al_hadit_test/features/al_hadith/data/model/books_model.dart';

import 'display_model.dart';

class DisplayModelMapper{

  static Future<List<DisplayModel>>  fromLocalSource(ListOfLocalData data)async{
    List<DisplayModel> displayModelList=[];

    displayModelList.addAll(data.bookModelList.map((book){
      return DisplayModel(book: book);
    }).toList());

    displayModelList.addAll(data.chapterModelList.map((chapter){
      return DisplayModel(chapter:  chapter);
    }).toList());

    displayModelList.addAll(data.hadithModelList.map((hadith){
      return DisplayModel(hadith:  hadith);
    }).toList());

    displayModelList.addAll(data.sectionModelList.map((section){
      return DisplayModel(section:  section);
    }).toList());
    return  displayModelList;
  }
}