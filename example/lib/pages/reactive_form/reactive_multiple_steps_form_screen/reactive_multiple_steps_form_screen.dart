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

    super.initState();
  }

  @override
  void dispose() {
    ListItemsProvider.close('getListOfGenders');
    ListItemsProvider.close('getListOfSocialNetwork');

    super.dispose();
  }

  List<Step> steps = [
    new Step(
      title: const Text('Profile'),
      isActive: true,
      state: StepState.editing,
      content: new Profile(),
    ),
    new Step(
      title: const Text('Social links'),
      isActive: true,
      state: StepState.disabled,
      content: new SocialLinksArray(),
    ),
  ];

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
      appBar: new AppBar(title: Text("Reactive multiple steps form")),
      drawer: new CustomDrawer(),
      body: new MultipleStepFormContainer(
        builder: (context, _) {
          return new Stepper(
            type: StepperType.horizontal,
            steps: this.steps,
            currentStep: currentStep,
            onStepContinue: () async {
              List<String> stepNames =
                  context.readMultipleStepFormStateIndexer().keys.toList();
              ReactiveFormState formState = context.readFormState(
                step: stepNames[currentStep],
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
