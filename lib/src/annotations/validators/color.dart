import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';
import '../validation_helper.dart';
import '../../utils/enums.dart';
import '../../utils/rules.dart';

/// [Color] validator permits you to check that a string value is a valid color.
/// {@category Metadata}
/// {@subCategory Validators}
class Color extends ValidationAnnotation {
  const Color({
    this.colorType,
    this.colorTypeOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the color type.
  final ColorType colorType;

  /// This is the color type.
  final String colorTypeOnProperty;

  /// This is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    try {
      if (value is! String) return false;

      ColorType colorTypeOnProperty =
          ValidationHelper.getLinkedProperty<TModel>(
              model, this.colorTypeOnProperty);

      return _validate(value, colorTypeOnProperty ?? this.colorType);
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value, ColorType colorType) {
    RegExp regExp = new RegExp(Rules.color[colorType]);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
