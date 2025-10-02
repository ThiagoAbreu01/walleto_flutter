abstract class ISharedPreferencesLocalStorage {
  Future<V?> read<V>(String key);
  Future<void> write<V>(String key, V value);
  Future<bool> contains<V>(String key);
  Future<void> clear();
  Future<void> remove(String key);
}
