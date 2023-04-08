import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});
}
