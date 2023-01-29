import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar(String msg) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(msg)));
  }
}
