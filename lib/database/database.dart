import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Chairs extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 3,max: 30)();
  TextColumn get picture => text().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get date => dateTime().withDefault(Constant(DateTime.now()))();
  BoolColumn get status => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey =>{id};
}

@UseMoor(tables: [Chairs])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true)));

  @override
  int get schemaVersion => 1;

  Future<List<Chair>> getAllChairs() => select(chairs).get();

  Future<int> insertChair(Chair chair) => into(chairs).insert(chair);

  Future<bool> updateChair(Chair chair) => update(chairs).replace(chair);

  Future<int> deleteChair(Chair chair) => delete(chairs).delete(chair);
}
