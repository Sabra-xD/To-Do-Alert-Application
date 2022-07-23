

//We need to save the light mode
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Theme_Services {
  final GetStorage _box = GetStorage();
 final  _key = "isDarkMode";



  bool GetIt(){
    return  _box.read<bool>(_key) ?? false;
  }

  bool loadthemefrombox() {
   return  _box.read<bool>(_key) ?? false;
  }

  _savetobox(bool isDarkMode){
      _box.write(_key, isDarkMode);
      //Here we save the value of the Light mode.
  }

  ThemeMode get theme {
    return loadthemefrombox() ? ThemeMode.dark : ThemeMode.light;
  }

  void SwitchThemes(){
    Get.changeThemeMode(theme);
    _savetobox(!loadthemefrombox());
  }


  String ReturnKey(){
    return _key;
  }
}