import 'package:app_name/src/preferences/base_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _TestEnum { value1, value2, value3, value4, value5 }

enum _OldTestEnum { oldValue1 }

void main() {
  group('BasePreferences Tests', () {
    setUpAll(() async {
      SharedPreferences.setMockInitialValues({});
      await BasePreferences.init();
    });

    test('getEnum should return defaultValue when key does not exist', () {
      // Arrange
      const key = 'non_existent_key';
      const defaultValue = _TestEnum.value3;
      // Act
      final result = BasePreferences.getEnum(
        key: key,
        values: _TestEnum.values,
        defaultValue: defaultValue,
      );
      // Assert
      expect(result, defaultValue);
    });

    test('getEnum should return matched enum value', () {
      // Arrange
      const key = 'existing_key';
      const storedValue = _TestEnum.value5;
      const defaultValue = _TestEnum.value3;
      // Act
      BasePreferences.setEnum(key, storedValue);
      final result = BasePreferences.getEnum(
        key: key,
        values: _TestEnum.values,
        defaultValue: defaultValue,
      );
      // Assert
      expect(result, storedValue);
    });

    test('getEnum should return defaultValue when no match is found', () {
      // Arrange
      const key = 'existing_key';
      const defaultValue = _TestEnum.value1;
      // Act
      BasePreferences.setEnum(key, _OldTestEnum.oldValue1);
      final result = BasePreferences.getEnum(
        key: key,
        values: _TestEnum.values,
        defaultValue: defaultValue,
      );
      // Assert
      expect(result, defaultValue);
    });

    test('setEnum should store enum value in SharedPreferences', () async {
      // Arrange
      const key = 'existing_key';
      const valueToStore = _TestEnum.value2;
      // Act
      await BasePreferences.setEnum(key, valueToStore);
      // Assert
      expect(BasePreferences.instance.getString(key), valueToStore.name);
    });
  });
}
