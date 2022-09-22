import 'dart:math';
import 'package:flutter/material.dart';

extension IterableExtension<T> on Iterable<T> {
  Iterable<T> distinctBy(Object Function(T e) getCompareValue) {
    var result = <T>[];
    forEach((element) {
      if (!result.any((x) => getCompareValue(x) == getCompareValue(element))) {
        result.add(element);
      }
    });
    return result;
  }
}

extension StringExtension on String {
  String get nextLine {
    if (length < 30) {
      return this;
    } else {
      return substring(0, 30);
    }
  }
}
