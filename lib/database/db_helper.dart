import 'package:mj_app_f/database/persona_table.dart';
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

    return await openDatabase(path, version: 2, onCreate: _createDB);
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

    await db.execute('''
      CREATE TABLE personaCommunity (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        rank INTEGER NOT NULL,
        arcana TEXT NOT NULL,
        contents TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE personaQuest (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        deadline TEXT NOT NULL,
        condition TEXT NOT NULL,
        contents TEXT NOT NULL,
        guide TEXT NOT NULL,
        reward TEXT NOT NULL,
        isComplete INTEGER NOT NULL
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

  Future<int> insertPersonaCommunity(PersonaCommunity persona) async {
    final db = await database;
    return await db.insert("personaCommunity", persona.toMap());
  }

  Future<List<PersonaCommunity>> createPersona3CommunityList() async {
    final list = <PersonaCommunity>[];
    list.addAll(await getPersonaCommunityList());

    for(var i in list) {
      await insertPersonaCommunity(i);
    }

    return list;
  }

  Future<List<PersonaCommunity>> getPersonaCommunityList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("personaCommunity");
    final result = maps.map((map) => PersonaCommunity.fromMap(map)).toList();

    if(result.isEmpty) {
      result.addAll(getNewPersonaCommunityList());
    }

    return result;
  }

  Future<int> insertPersonaQuest(PersonaQuest persona) async {
    final db = await database;
    return await db.insert("personaQuest", persona.toMap());
  }

  Future<List<PersonaQuest>> createPersona3QuestList() async {
    final list = <PersonaQuest>[];
    list.addAll(getNewPersonaQuestList());

    for(var i in list) {
      await insertPersonaQuest(i);
    }

    return list;
  }

  Future<List<PersonaQuest>> getPersonaQuestList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("personaQuest");
    final result = maps.map((map) => PersonaQuest.fromMap(map)).toList();

    if(result.isEmpty) {
      result.addAll(await createPersona3QuestList());
    } else {
      result.removeWhere((e) => e.isComplete == true);
    }

    return result;
  }
}
