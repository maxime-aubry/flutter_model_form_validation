import 'package:example/custom_drawer.dart';
import 'package:example/models.dart';
import 'package:example/pages/stepper_form/author_step_page.dart';
import 'package:example/pages/stepper_form/book_step_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class StepperFormPage extends StatefulWidget {
  static const String routeName = '/stepperForm';

  @override
  _StepperFormPageState createState() => _StepperFormPageState();
}

class _StepperFormPageState extends State<StepperFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  StepForm model = null;
  ModelFormState mfs = null;
  List<Step> steps = null;

  void initState() {
    super.initState();

    this.model = new StepForm();
    this.mfs = new ModelFormState(model: this.model, isMultipleStepsForm: true);

    this.steps = [
      Step(
        title: const Text('Author'),
        isActive: true,
        state: StepState.editing,
        content: FormGroupProvider<AuthorStep, FormGroupElement<AuthorStep>>(
          create: (context) => this.model.author,
          child: new AuthorStepPage(),
        ),
      ),
      Step(
        title: const Text('Books'),
        isActive: true,
        state: StepState.disabled,
        content: FormGroupProvider<BooksStep, FormGroupElement<BooksStep>>(
          create: (context) => this.model.books,
          child: new BooksStepPage(),
        ),
      ),
    ];
  }

  int currentStep = 0;
  bool complete = false;

  next() {
    bool isNotLastPage = (currentStep + 1 != steps.length);

    if (isNotLastPage)
      goTo(currentStep + 1);
    else
      setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) goTo(currentStep - 1);
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
