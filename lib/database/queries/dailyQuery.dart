class DailyQuery {
  static const String TABLE_NAME = "daily";
  static const String CREATE_TABLE =
      " CREATE TABLE IF NOT EXISTS $TABLE_NAME ( datetime TEXT PRIMARY KEY, data TEXT ) ";
  static const String SELECT = "select * from $TABLE_NAME";
}
