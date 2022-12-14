import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io ;

import 'package:sqflite/sqflite.dart';


class DBHelper {
  initdb()async{
    io.Directory car_rental_project = await getApplicationDocumentsDirectory();
    String path = join(car_rental_project.path , 'Car Rental System DataBase.db');
    bool dbexist = await io.File(path).exists();
    if (!dbexist) {
      ByteData data = await rootBundle.load(join("assets","Car Rental System DataBase.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes , data.lengthInBytes);
      await io.File(path).writeAsBytes(bytes , flush: true);
    }

    var theDB = await openDatabase(path , version: 1);
    return theDB;
  }
}