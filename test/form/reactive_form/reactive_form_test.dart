import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Form > ReactiveForm > ReactiveForm.', () {
    testWidgets('ReactiveForm is initialized.', (WidgetTester tester) async {
      ReactiveFormBuilder formBuilder = new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'control1': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        ),
      );

      await tester.pumpWidget(ReactiveForm(
        formBuilder: formBuilder,
        child: new FormGroupConsumer(
          builder: (_, formGroup, __) {
            return Text(formGroup.name);
          },
        ),
      ));
    });
  });
}
