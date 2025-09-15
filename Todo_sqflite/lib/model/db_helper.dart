import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_todo_list/model/todo_model.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper instance = DbHelper._();
  Database? _database;

  static final String tableName = 'todo';
  static final String columnId = 'id';
  static final String columnTask = 'task';
  static final String columnIsDone = 'isDone';

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String dirPath = await getDatabasesPath();
    String path = join(dirPath, 'todo.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'create table $tableName($columnId integer primary key autoincrement,$columnTask text, $columnIsDone bool)',
    );
  }

  Future<void> insert(TodoModel todoModel) async {
    final db = await instance.db;
    await db.insert(tableName, todoModel.toMap());
  }

  Future<List<TodoModel>> getAll() async {
    final db = await instance.db;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(
      maps.length,
      (index) => TodoModel.fromMap(maps[index]),
    );
  }

  Future<void> update(TodoModel todoModel) async {
    final db = await instance.db;
    await db.update(
      tableName,
      todoModel.toMap(),
      where: '$columnId = ?',
      whereArgs: [todoModel.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await instance.db;
    await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
