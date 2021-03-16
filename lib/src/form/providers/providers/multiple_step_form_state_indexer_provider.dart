import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:provider/provider.dart';

/// [MultipleStepFormStateIndexerProvider] provides [MultipleStepFormStateIndexer].
/// {@category Providers}
/// {@subCategory Providers}
class MultipleStepFormStateIndexerProvider
    extends Provider<MultipleStepFormStateIndexer> {
  MultipleStepFormStateIndexerProvider({
    Key key,
    @required Create<MultipleStepFormStateIndexer> create,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          builder: builder,
          child: child,
        );

  /// [of] provides a [MultipleStepFormStateIndexer].
  /// If [listen] is [True], [MultipleStepFormStateIndexer] will refresh each time the object will change.
  /// 
  /// You can use it just like this :
  /// 
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer =
  ///   MultipleStepFormStateIndexerProvider.of(context, listen: true);
  /// ```
  static MultipleStepFormStateIndexer of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<MultipleStepFormStateIndexer>(context, listen: listen);

  /// [MultipleStepFormStateIndexerProvider] provides a [MultipleStepFormStateIndexer] to a form.
  /// Use it when you want to instanciate a [MultipleStepFormStateIndexer] outside the provider.
  /// 
  /// You can use it just like this :
  /// 
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer = // ...
  /// 
  /// child: new MultipleStepFormStateIndexerProvider.value(
  ///   value: indexer,
  ///   builder: (context, _) {
  ///     return new Container();
  ///   },
  /// );
  /// ```
  MultipleStepFormStateIndexerProvider.value({
    Key key,
    @required MultipleStepFormStateIndexer value,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          value: value,
          builder: builder,
          child: child,
        );
}

extension MultipleStepFormStateIndexerExtension on BuildContext {
  /// [readMultipleStepFormStateIndexer] gets a [MultipleStepFormStateIndexer] object.
  /// If a widget use this object, it won't rebuild when object changes.
  /// 
  /// You can use it just like this :
  /// 
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer =
  ///   context.readMultipleStepFormStateIndexer();
  /// ```
  /// 
  /// If form has multiple steps, you can use it juste like it :
  /// 
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer =
  ///   context.readMultipleStepFormStateIndexer(step: 'step1');
  /// ```
  MultipleStepFormStateIndexer readMultipleStepFormStateIndexer() =>
      MultipleStepFormStateIndexerProvider.of(this, listen: false);

  /// [watchMultipleStepFormStateIndexer] gets a [MultipleStepFormStateIndexer] object.
  /// If a widget use this object, it will rebuild when object changes.
  /// 
  /// You can use it just like this :
  /// 
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer =
  ///   context.watchMultipleStepFormStateIndexer();
  /// ```
  /// 
  /// If form has multiple steps, you can use it juste like it :
  /// 
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer =
  ///   context.watchMultipleStepFormStateIndexer(step: 'step1');
  /// ```
  MultipleStepFormStateIndexer watchMultipleStepFormStateIndexer() =>
      MultipleStepFormStateIndexerProvider.of(this, listen: true);
}
