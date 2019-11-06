
class Migration{

  String _migrations;

  Migration(){
    _migrations = "";
    _initialTables();
  }

  String get() {
    return _migrations;
  }

  void _initialTables(){
    _migrations += "CREATE TABLE IF NOT EXISTS user ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT,"
      "); ";
  }

}