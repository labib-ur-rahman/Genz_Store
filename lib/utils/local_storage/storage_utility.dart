import 'package:get_storage/get_storage.dart';

class SLLocalStorage {

  late final GetStorage _storage;

  // Singleton instance
  static SLLocalStorage? _instance;

  SLLocalStorage._internal();

  factory SLLocalStorage.instance() {
    _instance ??= SLLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = SLLocalStorage._internal();
    _instance!._storage = GetStorage (bucketName);
  }

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}