import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Foods extends Table {
  IntColumn get id => integer()();

  TextColumn get title => text()();

  TextColumn get desc => text()();

  TextColumn get img => text()();
}

@UseMoor(tables: [Foods])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", logStatements: true));

  int get schemaVersion => 2;

  Future<List<Food>> getAll() => select(foods).get();

  Stream<Food> getbyId(int id) {
    return (select(foods)..where((tbl) => tbl.id.equals(id))).watchSingle();
  }

  Stream<List<Food>> watchAll() => select(foods).watch();

  Future insertNew(Food food) => into(foods).insert(food);

  Future deleteFood(Food food) {
    return (delete(foods)..where((tbl) => tbl.id.equals(food.id))).go();
  }
}
