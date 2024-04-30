import 'package:flutter/material.dart';
import 'package:sellusapp/core/storages/base_object_storages/object_storage.dart';

class ThemeStorage extends ObjectStorage<ThemeMode> {
  @override
  ThemeMode decode(Map<String, dynamic> json) {
    return json['value'];
  }

  @override
  Map<String, dynamic> encode(ThemeMode object) {
    final encodedValue = {
      'value': object,
    };
    return encodedValue;
  }

  @override
  Future<ThemeMode?> readObject() async {
    ThemeMode? theme = await super.readObject();
    return setup(theme);
  }

  @override
  Future<void> writeObject(ThemeMode object) async {
    await super.writeObject(object);
    setup(object);
  }

  Future<ThemeMode> setup(ThemeMode? theme) async {
    return theme ?? ThemeMode.system;

  }
}
