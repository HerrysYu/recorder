import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class member{
   String country;
   String name;
   String content;
   member({
    required this.country,
    required this.name,
    required this.content
   });
  Map<String, Object?> toMap() {
    return {
      'country': country,
      'name':name,
      'content':content
  };
}
 @override
  String toString() {
    return 'member{country:$country,name:$name,content:$content}';
  }
}
List<member> mL=[];
class sqlhelper{
  Insert(member member) async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'member_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE member(name TEXT PRIMARY KEY, country TEXT , content TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    db.insert('member', member.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<member>> members() async {
    // Get a reference to the database.
    final db = await openDatabase(
      join(await getDatabasesPath(), 'member_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE member(name TEXT PRIMARY KEY, country TEXT,content TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    // Query the table for all the dogs.
    final List<Map<String, Object?>> membersmaps = await db.query('member');
    // Convert the list of each dog's fields into a list of `Dog` objects.
    return [
      for (final {
            'country': country as String,
            'name':name as String,
            'content':content as String 
          } in membersmaps)
        member(country: country,name: name,content:content ),
    ];
  }
   Future<void> updatemembers(member member) async {
    final db = await openDatabase(
        join(await getDatabasesPath(), 'member_database.db'),
        version: 1);
    db.update('member', member.toMap(),
        where: 'name=?', whereArgs: [member.name]);
  }
Future<void> deletemember(String name) async {
    final db = await openDatabase(
        join(await getDatabasesPath(), 'member_database.db'),
        version: 1);
    db.delete('member', where: 'name=?', whereArgs: [name]);
  }

}