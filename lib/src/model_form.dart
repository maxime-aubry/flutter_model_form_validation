import 'package:flutter/foundation.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

typedef PropertyCallback<String> = void Function(String);

class ModelForm extends PropertyChangeNotifier<String> {
  @override
  @protected
  @visibleForTesting
  bool get hasListeners => super.hasListeners;

  @override
  void addListener(Function listener, [Iterable<String> properties]) =>
      super.addListener(listener, properties);

  @override
  void removeListener(Function listener, [Iterable<String> properties]) =>
      super.removeListener(listener, properties);

  @override
  @mustCallSuper
  void dispose() => super.dispose();

  @override
  @protected
  @visibleForTesting
  void notifyListeners([String property]) => super.notifyListeners(property);

  void notifyModelState(String property) =>
      this.notifyListeners('${this.hashCode}.${property}');
}
