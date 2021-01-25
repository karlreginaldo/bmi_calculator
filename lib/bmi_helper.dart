import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final String tableBMI = 'bmihistory';
final String columnId = 'id';
final String columnResult = 'result';
final String columnCategory = 'category';
final String columnDate = 'date';

class BMIHelper {
  static Database _database;
  static BMIHelper _bmiHelper;

  BMIHelper._creatingInstance();

//Check if my BMIHelper class is initialized but i dont know why they initialized a class
  factory BMIHelper() {
    if (_bmiHelper == null) {
      _bmiHelper = BMIHelper._creatingInstance();
    }
    return _bmiHelper;
  }

  //Checking if database is Initialized
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  //Initialized the database then creating it
  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + 'bmi.db';

    //Creating tables now!
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
      create table $tableBMI (
        $columnId integer primary key autoincrement,
        $columnResult text not null,
        $columnCategory text not null,
        $columnDate text not null
      )
      ''');
        //SqLite Data Types
        //int = integer
        //String = text
        //!null = not null
        //DateTime is not a supported SQLite type. Personally You can store them as int (millisSinceEpoch) or string (iso8601)
        //bool is not a supported SQLite type. Use INTEGER and 0 and 1 values.
      },
    );
  }
}
