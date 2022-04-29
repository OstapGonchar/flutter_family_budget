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

FormFieldValidator<Object> isNullValidator({String message = 'Please choose the value'}) {
  return (Object? value) {
    if (value == null) {
      return message;
    } else {
      return null;
    }
  };
}
