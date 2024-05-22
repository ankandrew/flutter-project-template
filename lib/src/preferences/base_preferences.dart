import 'package:shared_preferences/shared_preferences.dart';

class BasePreferences {
  static late final SharedPreferences instance;

  /// Initializes the SharedPreferences instance.
  ///
  /// You should call this method once at the beginning of your application
  /// to ensure SharedPreferences is properly initialized.
  ///
  /// Returns the initialized SharedPreferences instance.
  static Future<SharedPreferences> init() async {
    instance = await SharedPreferences.getInstance();
    return instance;
  }

  /// Retrieves an enum value from SharedPreferences.
  ///
  /// [key] is the key under which the enum value is stored.
  /// [values] is a list of enum values of type [T].
  /// [defaultValue] is the value to return if no value is found in SharedPreferences.
  ///
  /// Returns the retrieved enum value, or [defaultValue] if not found.
  ///
  /// Note: This method should be used in conjunction with [setEnum] to store and retrieve enum
  /// values in SharedPreferences.
  static T getEnum<T extends Enum>({
    required String key,
    required List<T> values,
    required T defaultValue,
  }) {
    final storedValue = BasePreferences.instance.getString(key);
    // The default values will be returned in 2 scenarios:
    // 1. When `storedValue` was null, since it was never saved under the `key`
    // 2. When `storedValue` has a value that is not present in the enum `values`
    return storedValue != null
        ? values.firstWhere((value) => value.name == storedValue, orElse: () => defaultValue)
        : defaultValue;
  }

  /// Sets an enum value in SharedPreferences.
  ///
  /// [key] is the key under which the enum value will be stored.
  /// [value] is the enum value of type [T] to store.
  ///
  /// Note: The enum value is stored in SharedPreferences as a string using its name.
  static Future<void> setEnum<T extends Enum>(String key, T value) async {
    await BasePreferences.instance.setString(key, value.name);
  }
}
