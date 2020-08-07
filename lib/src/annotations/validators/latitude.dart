import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';
import '../validation_helper.dart';
import '../../utils/enums.dart';
import '../../utils/rules.dart';

/// [Latitude] validator permits you to check that a string value is a valid latitude.
/// {@category Metadata}
/// {@subCategory Validators}
class Latitude extends ValidationAnnotation {
  const Latitude({
    this.gpsFormat,
    this.gpsFormatOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the custom error to return in case of invalidation.
  final GpsFormat gpsFormat;

  /// This is the custom error to return in case of invalidation on a targeted property.
  final String gpsFormatOnProperty;

  /// This is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    try {
      if (value is! String) return false;

      GpsFormat gpsFormatOnProperty =
          ValidationHelper.getLinkedProperty<TModel>(
              model, this.gpsFormatOnProperty);

      return _validate(value, gpsFormatOnProperty ?? this.gpsFormat);
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value, GpsFormat gpsFormat) {
    if (!Rules.latitude.containsKey(gpsFormat)) return false;

    RegExp regExp = new RegExp(Rules.latitude[gpsFormat]);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
