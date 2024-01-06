import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/PurchaseCourseModel.dart';
import '../model/UserCourseModel.dart';

class DataBase {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'usercourse.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE usercourse(id INTEGER PRIMARY KEY , name TEXT NOT NULL,userId TEXT NOT NULL,videono INTEGER NOT NULL)",
        );
        await db.execute(
          "CREATE TABLE purchasecourse(id INTEGER PRIMARY KEY , name TEXT NOT NULL,userId TEXT NOT NULL)",
        );
      },
    );
  }

  // insert data
  Future<int> insertUserCourses(List<UserCourseModel> planets) async {
    int result = 0;
    final Database db = await initializedDB();
    for (var planet in planets) {
      result = await db.insert('usercourse', planet.toMap());
    }
    return result;
  }

  Future<int> insertUserPurchaseCourse(List<PurchaseCourseModel> planets) async {
    int result = 0;
    final Database db = await initializedDB();
    for (var planet in planets) {
      result = await db.insert('purchasecourse', planet.toMap());
    }
    return result;
  }

  // retrieve data
  Future<List<UserCourseModel>> retrieveUserCourseModel() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('usercourse');
    return queryResult.map((e) => UserCourseModel.fromMap(e)).toList();
  }


  Future<List<PurchaseCourseModel>> retrieveUserPurchaseCourse() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('purchasecourse');
    return queryResult.map((e) => PurchaseCourseModel.fromMap(e)).toList();
  }
}