import 'package:example/custom_drawer.dart';
import 'package:example/models.dart';
import 'package:example/pages/stepper_form/book_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class StepperForm extends StatefulWidget {
  static const String routeName = '/stepperForm';

  @override
  _StepperFormState createState() => _StepperFormState();
}

class _StepperFormState extends State<StepperForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ModelFormState mfs = null;
  List<Step> steps = null;

  void initState() {
    super.initState();

    this.mfs = new ModelFormState(new StepForm());

    this.steps = [
      /*Step(
        title: const Text('Author'),
        isActive: true,
        state: StepState.editing,
        content: new AuthorStep(mfs: this.mfs),
      ),*/
      Step(
        title: const Text('Books'),
        isActive: true,
        state: StepState.disabled,
        content: new BooksStep(mfs: this.mfs),
      ),
    ];
  }

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Stepper form")),
      drawer: CustomDrawer(),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Stepper(
          type: StepperType.horizontal,
          steps: steps,
          currentStep: currentStep,
          onStepContinue: next,
          onStepTapped: (step) => goTo(step),
          onStepCancel: cancel,
        ),
      ),
    );
  }
}
