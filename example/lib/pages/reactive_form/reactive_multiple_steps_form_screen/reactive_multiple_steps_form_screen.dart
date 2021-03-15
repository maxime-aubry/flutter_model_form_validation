import 'package:example/custom_drawer.dart';
import 'package:example/models.dart';
import 'package:example/pages/reactive_form/reactive_multiple_steps_form_screen/profile.dart';
import 'package:example/pages/reactive_form/reactive_multiple_steps_form_screen/social_links_array.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class ReactiveMultipleStepsFormScreen extends StatefulWidget {
  static const String routeName = '/reactiveMultipleStepsForm';

  @override
  _ReactiveMultipleStepsFormScreenState createState() =>
      _ReactiveMultipleStepsFormScreenState();
}

class _ReactiveMultipleStepsFormScreenState
    extends State<ReactiveMultipleStepsFormScreen> {
  @override
  void initState() {
    ListItemsProvider.clear();

    ListItemsProvider.register<EGender>(
      'getListOfGenders',
      () async => [
        new SelectListItem<EGender>(EGender.male, 'male'),
        new SelectListItem<EGender>(EGender.female, 'female'),
      ],
    );

    ListItemsProvider.register<ESocialNetwork>(
      'getListOfSocialNetwork',
      () async => [
        new SelectListItem<ESocialNetwork>(ESocialNetwork.facebook, 'Facebook'),
        new SelectListItem<ESocialNetwork>(ESocialNetwork.github, 'Github'),
        new SelectListItem<ESocialNetwork>(ESocialNetwork.pub, 'Pub.dev'),
        new SelectListItem<ESocialNetwork>(ESocialNetwork.twitter, 'Twitter'),
      ],
    );

    this.steps = [
      new Step(
        title: const Text('Profile'),
        isActive: true,
        state: this.getStepState(0),
        content: new Profile(),
      ),
      new Step(
        title: const Text('Social links'),
        isActive: true,
        state: this.getStepState(1),
        content: new SocialLinksArray(),
      ),
    ];

    super.initState();
  }

  @override
  void dispose() {
    ListItemsProvider.close('getListOfGenders');
    ListItemsProvider.close('getListOfSocialNetwork');

    super.dispose();
  }

  List<Step> steps = [];
  int currentStep = 0;

  StepState getStepState(int index) {
    if (index < currentStep) return StepState.complete;
    if (index == currentStep) return StepState.editing;
    return StepState.indexed;
  }

  /*StepState getStepState(int index, String step) {
    if (!indexer.keys.contains(step)) {
      if (index == currentStep) return StepState.editing;
      return StepState.indexed;
    }

    int indexOfStep = indexer.keys.toList().indexOf(step);
    if (indexOfStep < currentStep) return StepState.complete;
    if (indexOfStep == currentStep) return StepState.editing;
    return StepState.indexed;
  }*/

  void next() {
    bool isNotLastPage = ((this.currentStep + 1) != this.steps.length);
    if (isNotLastPage) goTo(this.currentStep + 1);
  }

  void cancel() {
    if (this.currentStep > 0) goTo(this.currentStep - 1);
  }

  void goTo(int step) {
    setState(() => this.currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("Reactive multiple steps form")),
      drawer: new CustomDrawer(),
      body: new MultipleStepFormContainer(
        builder: (context, _) {
          return new Stepper(
            type: StepperType.horizontal,
            steps: this.steps,
            currentStep: currentStep,
            onStepContinue: () async {
              List<String> stepsNames =
                  context.readMultipleStepFormStateIndexer().keys.toList();

              ReactiveFormState formState = context.readFormState(
                step: stepsNames[currentStep],
              );

              if (await formState.validate()) {
                // Data treatment and post to server here...
                next();
              }
            },
            onStepTapped: (step) => goTo(step),
            onStepCancel: cancel,
          );
        },
      ),
    );
  }
}
