import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';
  
  // Observable boolean to track theme state
  final isDarkMode = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = _loadThemeFromBox();
  }

  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _saveThemeToBox(isDarkMode.value);
    

    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
  

  ThemeMode get themeMode => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
}