// This file has been generated by the dart_json_mapper package.
// https://github.com/k-paxian/dart-json-mapper
import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, JsonMapperAdapter, typeOf;

// No output from reflectable, 'package:reflectable/reflectable.dart' not used.
final login_form_eventAdapter = JsonMapperAdapter(
  title: 'login_form_eventAdapter',
  url: 'asset:flutter_model_form_validation/example/lib/blocs/login_form_event.dart',
  valueDecorators: {

});

JsonMapper initializeJsonMapper({Iterable<JsonMapperAdapter> adapters = const []}) {
  _initializeReflectable();
  [...adapters, login_form_eventAdapter].forEach((x) => JsonMapper().useAdapter(x));
  return JsonMapper();
}