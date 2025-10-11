import 'package:shared_preferences/shared_preferences.dart';
import 'package:granio_flutter/app/core/local_storage/shared_preferences/i_shared_preferences_local_storage.dart';

class SharedPreferencesLocalStorage implements ISharedPreferencesLocalStorage {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sharedPreferences = await _instance;
    sharedPreferences.clear();
  }

  @override
  Future<bool> contains<V>(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.containsKey(key);
  }

  @override
  Future<V?> read<V>(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.get(key) as V?;
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferences = await _instance;
    sharedPreferences.remove(key);
  }

  @override
  Future<void> write<V>(String key, V value) async {
    final sharedPreferences = await _instance;

    switch (V) {
      case const (String):
        await sharedPreferences.setString(key, value as String);
        break;

      case const (int):
        await sharedPreferences.setInt(key, value as int);
        break;

      case const (double):
        await sharedPreferences.setDouble(key, value as double);
        break;

      case const (bool):
        await sharedPreferences.setBool(key, value as bool);
        break;

      case const (List<String>):
        await sharedPreferences.setStringList(key, value as List<String>);
        break;

      default:
        throw Exception('Type not supported');
    }
  }
}
