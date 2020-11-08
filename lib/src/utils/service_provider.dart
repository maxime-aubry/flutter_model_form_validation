/// [ServiceProvider] provides data to validators, as dropdown, autocomplete...
/// Items are provided from local or global data, or using by a HTTP request.
class ServiceProvider {
  static Map<String, Function> _services;

  static void register(String name, Function f) {
    assert(name != null, '');
    assert(!name.isEmpty, '');
    assert(f != null, '');

    if (ServiceProvider._services == null)
      ServiceProvider._services = new Map<String, Function>();
    ServiceProvider._services[name] = f;
  }

  static void close(String name) {
    assert(name != null, '');
    assert(!name.isEmpty, '');

    if (ServiceProvider._services == null)
      ServiceProvider._services = new Map<String, Function>();
    ServiceProvider._services.remove(name);
  }

  static Function get(String name) {
    assert(name != null, '');
    assert(!name.isEmpty, '');

    if (!ServiceProvider._services.containsKey(name))
      throw new Exception('Service not found');

    Function service = ServiceProvider._services[name];
    return service;
  }
}
