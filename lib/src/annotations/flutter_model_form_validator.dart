import 'package:reflectable/reflectable.dart';

/// @flutterModelFormValidator must be declared on each class you want to submit to validation.
/// You must declared by writing @flutterModelFormValidator of the top of your class.
/// {@category Metadata}
/// {@subCategory flutterModelFormValidator}
class FlutterModelFormValidator extends Reflectable {
  const FlutterModelFormValidator()
      : super(
          declarationsCapability,
          instanceInvokeCapability,
          metadataCapability,
          reflectedTypeCapability,
          // typeCapability,
          // typeRelationsCapability,
          // typingCapability,
        );
}

const flutterModelFormValidator = FlutterModelFormValidator();
