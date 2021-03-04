import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

typedef Future<List<SelectListItem<TProperty>>> ListItemsServiceFunction<
    TProperty>();

/// [ListItemsProvider] provides data to validators, as dropdown, autocomplete...
/// Items are provided from local or global data, or using by a HTTP request.
class ListItemsProvider {
  static Map<String, ListItemsServiceFunction> _services = {};

  static void clear() {
    if (ListItemsProvider._services == null)
      ListItemsProvider._services = new Map<String, ListItemsServiceFunction>();

    ListItemsProvider._services.clear();
  }

  static void register<TProperty>(
    String name,
    ListItemsServiceFunction<TProperty> service,
  ) {
    if (name == null || name.isEmpty)
      throw new ListItemProviderException('Service name is required.');

    if (service == null)
      throw new ListItemProviderException('Service is required.');

    if (ListItemsProvider._services == null)
      ListItemsProvider._services = new Map<String, ListItemsServiceFunction>();

    if (ListItemsProvider._services.containsKey(name))
      throw new ListItemProviderException(
          'Service name is already registered.');

    ListItemsProvider._services[name] = service;
  }

  static void close(String name) {
    if (name == null || name.isEmpty)
      throw new ListItemProviderException('Service name is required.');

    if (!ListItemsProvider._services.containsKey(name))
      throw new ListItemProviderException('Service name is not recognized.');

    if (ListItemsProvider._services == null)
      ListItemsProvider._services = new Map<String, ListItemsServiceFunction>();

    ListItemsProvider._services.remove(name);
  }

  static ListItemsServiceFunction<TProperty> provide<TProperty>(String name) {
    if (name == null || name.isEmpty)
      throw new ListItemProviderException('Service name is required.');

    if (!ListItemsProvider._services.containsKey(name))
      throw new ListItemProviderException('Service name is not recognized.');

    ListItemsServiceFunction<TProperty> service =
        ListItemsProvider._services[name];
    return service;
  }
}
