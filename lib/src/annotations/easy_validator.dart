import 'package:reflectable/reflectable.dart';

/// @easyVallidator must be declared on each class you want to submit to validation.
/// You must declared by writing @easyVallidator of the top of your class.
/// {@category Metadata}
/// {@subCategory EasyValidator}
class EasyValidator extends Reflectable {
  const EasyValidator()
      : super(
          metadataCapability,
          instanceInvokeCapability,
          declarationsCapability,
        );
}

const easyValidator = EasyValidator();
