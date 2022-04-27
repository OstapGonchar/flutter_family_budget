import 'package:flutter/material.dart';

FormFieldValidator<String> isEmptyStringValidator({String message = 'Please choose the value'}) {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return message;
    } else {
      return null;
    }
  };
}
