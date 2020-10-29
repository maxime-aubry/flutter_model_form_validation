import 'package:flutter/foundation.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

class ModelForm with PropertyChangeNotifier<String> {
  @protected
  void notifyModelState(String property) {
    String listenerName = this.getListenerName(property);
    this.notifyListeners(listenerName);
  }

  String getListenerName(String property) => '${this.hashCode}.$property';
}
