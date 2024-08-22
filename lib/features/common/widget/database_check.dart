import 'dart:developer';
import 'dart:io';

import 'package:al_hadit_test/dependency_container.dart';
import 'package:al_hadit_test/features/al_hadith/data/datasource/local_data_source.dart';
import 'package:al_hadit_test/features/al_hadith/data/repository/al_hadith_repository.dart';
import 'package:al_hadit_test/features/al_hadith/presentation/getx/al_hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Database? _dataBase;
  List<Map> _data = [];
 LocalDataSource localDataSource=LocalDataSource();
 AlHadithRepository alHadithRepository=AlHadithRepository(localDataSource: di<LocalDataSource>());
  final AlHadithController _alHadithController = Get.find<AlHadithController>();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      openDataBase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Test Database'),
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            final dataIndex = _data[index];
            return Text(dataIndex['narrator']);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         openDataBase();
          //localDataSource.openDataBase();
         // alHadithRepository.attemptToOpenDataBase();
          //_alHadithController.fetchData();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> openDataBase() async {
    final dataBasePath = await getDatabasesPath();

    String path = join(dataBasePath, 'hadith_db.db');

    bool exists = await databaseExists(path);

    if(!exists){
    final data = await rootBundle.load('assets/hadith_db/hadith_db.db');
     final byte =  data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);

     await File(path).writeAsBytes(byte,flush: true);
    }

    _dataBase = await openDatabase(path, version: 1,);

    await getAllListOfTable(_dataBase!);
    await checkRequiredTable(_dataBase!);
    await verifyTable(_dataBase!);



     List<Map<String, dynamic>> checkTable = await _dataBase!.rawQuery(
        'SELECT name FROM sqlite_master WHERE type="table" AND name="hadith"');
    if (checkTable.isEmpty) {
      print('the table hadith is empty');
    } else {
      print('Table "hadith" exists in the database.');
    }

    List<Map<String,dynamic>> result = await _dataBase!.query('hadith', limit: 30);

     setState(() {
      _data = result;
    });

    await deleteDatabase(path);
  }

  Future<List<String>> getAllListOfTable(Database database)async{
    final checkOtherTable = await database
        .rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    if (checkOtherTable.isEmpty) {
      print('No table exist');
    } else {
      print('table :${checkOtherTable.map((e) {
        return e['name'] as String;
      }).toList()}');
    }
    return checkOtherTable.map((e) => e['name'] as String).toList();
  }

  Future<bool>checkRequiredTable(Database database)async{
    List<String>   listOfTables=  await getAllListOfTable(database);
    List<String> requiredTable= ['chapter','books','hadith','section'];

    for( String table in requiredTable){
      if(!listOfTables.contains(table)){
        return false;
      }
    }
    return true;
  }
  verifyTable(Database database)async{
    bool allTablePresent= await checkRequiredTable(database);
    if(allTablePresent){
      log('all table are present');
    }else{
      log('Table are missing');
    }
  }

}