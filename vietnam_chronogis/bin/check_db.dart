import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

void main() async {
  final dbFolder = File(Platform.environment['USERPROFILE']! + '\\Documents\\vietnam_chronogis\\chronogis.sqlite');
  if (!dbFolder.existsSync()) {
    print("DB not found at ${dbFolder.path}");
    // Let's search standard path if we can't find it
    final standardPath = File('C:\\Users\\USER\\Documents\\vietnam_chronogis\\chronogis.sqlite');
    if (!standardPath.existsSync()) {
       print("DB not found at ${standardPath.path}");
       return;
    }
    
    final db = sqlite3.open(standardPath.path);
    final ResultSet resultSet = db.select('SELECT ma, ten, density FROM administrative_units WHERE kind="province" LIMIT 5');
    for (final row in resultSet) {
      print('ma: ${row['ma']}, ten: ${row['ten']}, density: ${row['density']}');
    }
    db.dispose();
  } else {
    final db = sqlite3.open(dbFolder.path);
    final ResultSet resultSet = db.select('SELECT ma, ten, density FROM administrative_units WHERE kind="province" LIMIT 5');
    for (final row in resultSet) {
      print('ma: ${row['ma']}, ten: ${row['ten']}, density: ${row['density']}');
    }
    db.dispose();
  }
}
