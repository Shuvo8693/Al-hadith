import 'dart:developer';
import 'dart:io';

import 'package:al_hadit_test/features/al_hadith/data/model/books_model.dart';
import 'package:al_hadit_test/features/al_hadith/data/model/chapter_model.dart';
import 'package:al_hadit_test/features/al_hadith/data/model/hadith_model.dart';
import 'package:al_hadit_test/features/al_hadith/data/model/section_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataSource {
 late Database _database;

  List<BookModel> bookModelList = [];
  List<ChapterModel> chapterModelList = [];
  List<HadithModel> hadithModelList = [];
  List<SectionModel> sectionModelList = [];
  String errorMessage = '';

  Future<Either<String,ListOfLocalData>> openDataBase() async {
    try {
      final dataBasePath = await getDatabasesPath();

      String path = join(dataBasePath, 'hadith_db.db');

      bool exists = await databaseExists(path);

      if (!exists) {
        final data = await rootBundle.load('assets/hadith_db/hadith_db.db');
        final byte =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

        await File(path).writeAsBytes(byte, flush: true);
      }

      _database = await openDatabase(
        path,
        version: 1,
      );

      final resultBook = await _fetchBookData(_database);
      final resultChapter = await _fetchChapterData(_database);
      final resultHadith = await _fetchHadithData(_database);
      final resultSection = await _fetchSectionData(_database);

      final listOfLocalData= ListOfLocalData(
          bookModelList: resultBook,
          chapterModelList: resultChapter,
          hadithModelList: resultHadith,
          sectionModelList: resultSection);

      return Right(listOfLocalData);
    } catch (error) {
      errorMessage = error.toString();
      log(errorMessage);
      return Left(errorMessage);
    }
  }

  Future<List<BookModel>> _fetchBookData(Database database) async {
    try{
      List<Map<String, dynamic>> result = await database.query('books', limit: 30);
      bookModelList = result.map((element) => BookModel.fromJson(element)).toList();
      return bookModelList;
    }catch(error){
      log('Book error: $error');
      return [];
    }

  }

  Future<List<ChapterModel>> _fetchChapterData(Database database) async {
   try{
     List<Map<String, dynamic>> result =
     await database.query('chapter', limit: 30);
     chapterModelList =
         result.map((element) => ChapterModel.fromJson(element)).toList();
     return chapterModelList;
   }catch(error){
     log('Chapter error: $error');
     return[];
   }
  }

  Future<List<HadithModel>> _fetchHadithData(Database database) async {
    try{
      List<Map<String, dynamic>> result =
      await database.query('hadith', limit: 30);
      hadithModelList =
          result.map((element) => HadithModel.fromJson(element)).toList();
      return hadithModelList;
    }catch(error){
      log('Hadith error: $error');
      return[];
    }

  }

  Future<List<SectionModel>> _fetchSectionData(Database database) async {
    try{
      List<Map<String, dynamic>> result =
      await database.query('section', limit: 30);
      sectionModelList =
          result.map((element) => SectionModel.fromJson(element)).toList();
      return sectionModelList;
    }catch(error){
      log('Section error: $error');
      return[];
    }

  }
}

class ListOfLocalData {
  final List<BookModel> bookModelList;
  final List<ChapterModel> chapterModelList;
  final List<HadithModel> hadithModelList;
  final List<SectionModel> sectionModelList;

  ListOfLocalData(
      {required this.bookModelList,
      required this.chapterModelList,
      required this.hadithModelList,
      required this.sectionModelList});
}
