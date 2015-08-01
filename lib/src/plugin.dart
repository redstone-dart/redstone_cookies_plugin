part of redstone.headers_plugin;

cookiesPlugin(app.Manager manager) {
  manager.addParameterProvider(Cookie, (Cookie metadata, Type type, String handlerName, String paramName, app.Request req, injector) {
    var key = metadata.key != null? metadata.key: paramName;
    var cookies = new ck.CookieJar(req.headers.cookie);
    return type == ck.Cookie? cookies[key]: new List<String>().runtimeType.toString() == type.toString()? cookies[key].value.split(','): cookies[key].value;
  });
}