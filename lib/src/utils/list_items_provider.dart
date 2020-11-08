import 'package:flutter_model_form_validation/src/utils/index.dart';

typedef List<SelectListItem> ListItemsServiceFunction();

/// [ListItemsProvider] provides data to validators, as dropdown, autocomplete...
/// Items are provided from local or global data, or using by a HTTP request.
class ListItemsProvider {
  static Map<String, ListItemsServiceFunction> _services;

  static void register(String name, ListItemsServiceFunction f) {
    if (name == null || name.isEmpty)
      throw new Exception('Service name is required');

    if (f == null) throw new Exception('Service is required');

    if (ListItemsProvider._services == null)
      ListItemsProvider._services = new Map<String, ListItemsServiceFunction>();
    ListItemsProvider._services[name] = f;
  }

  static void close(String name) {
    if (name == null || name.isEmpty)
      throw new Exception('Service name is required');

    if (ListItemsProvider._services == null)
      ListItemsProvider._services = new Map<String, ListItemsServiceFunction>();
    ListItemsProvider._services.remove(name);
  }

  static Function get(String name) {
    if (name == null || name.isEmpty)
      throw new Exception('Service name is required');

    if (!ListItemsProvider._services.containsKey(name))
      throw new Exception('Service not found');

    Function service = ListItemsProvider._services[name];
    return service;
  }
}
