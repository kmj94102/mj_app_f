import 'package:mj_app_f/database/pokemon_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static DBHelper instance = DBHelper();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("f_mj_app.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pokemonCounter (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image TEXT NOT NULL,
        shinyImage TEXT NOT NULL,
        spotlight TEXT NOT NULL,
        count INTEGER NOT NULL,
        isCatch INTEGER NOT NULL,
        timestamp INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insertPokemon(PokemonCounter pokemon) async {
    final db = await database;
    return await db.insert("pokemonCounter", pokemon.toMap());
  }

  Future<List<PokemonCounter>> getPokemonList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      "pokemonCounter",
      where: "isCatch = 0",
    );
    return maps.map((map) => PokemonCounter.fromMap(map)).toList();
  }

  Future<List<PokemonCounter>> getPokemonHistoryList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      "pokemonCounter",
      where: "isCatch = 1",
    );
    return maps.map((map) => PokemonCounter.fromMap(map)).toList();
  }

  Future<int> updateIsCatch(int id, bool isCatch) async {
    final db = await database;
    return await db.update(
      "pokemonCounter",
      {"isCatch": isCatch ? 1 : 0},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateCount(int id, int count) async {
    final db = await database;
    return await db.update(
      "pokemonCounter",
      {"count": count},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> deletePokemon(int id) async {
    final db = await database;
    return await db.delete("pokemonCounter", where: "id = ?", whereArgs: [id]);
  }
}
