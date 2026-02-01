import 'package:gymtracker/data/model/exercise.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'training_database.db');

    return await openDatabase(path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
              'CREATE TABLE trainings('
                  'trainingId INTEGER PRIMARY KEY, '
                  'name TEXT, notes TEXT, '
                  'iconPath TEXT)');
          await db.execute(
            'CREATE TABLE exercises('
                'exerciseId INTEGER PRIMARY KEY, '
                'name TEXT, '
                'notes TEXT, '
                'iconPath TEXT)');
          await db.execute(
              'CREATE TABLE training_exercise('
                  'trainingId INTEGER, '
                  'exerciseId INTEGER, '
                  'FOREIGN KEY (trainingId) REFERENCES trainings(trainingId),'
                  'FOREIGN KEY (exerciseId) REFERENCES exercises(exerciseId))');
        });
  }

  Future<int> insertExercise(Exercise exercise) async {
    Database db = await instance.db;
    return await db.insert('exercises', exercise.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAllExercises() async {
    Database db = await instance.db;
    return await db.query('exercises');
  }

  Future<int> updateExercise(Exercise exercise) async {
    Database db = await instance.db;
    return await db.update('exercises', exercise.toMap(), where: 'exerciseId = ?', whereArgs: [exercise.exerciseId]);
  }

  Future<int> deleteExercise(int id) async {
    Database db = await instance.db;
    return await db.delete('exercises', where: 'exerciseId = ?', whereArgs: [id]);
  }

}