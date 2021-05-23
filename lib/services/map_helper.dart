class MapHelper {
  Map<String, dynamic> map;

  MapHelper(this.map);

  String _getString(String key) {
    String result = map[key];
    return result;
  }

  double _getDouble(String key) {
    dynamic result = map[key];
    if (result == null || result.toString().toLowerCase() == "null")
      return null;
    else if (result is double)
      return result;
    else
      return double.parse(result);
  }

  bool _getBool(String key) {
    dynamic result = map[key];
    if (result == null)
      return null;
    else if (result is bool)
      return result;
    else if (result is int)
      return result == 1;
    else
      return null;
  }

  int _getInt(String key) {
    dynamic result = map[key];
    if (result == null)
      return null;
    else if (result is int)
      return result;
    else
      return int.parse(result);
  }

  T getData<T>(String key) {
    if (!map.containsKey(key)) return null;

    if (T.toString() == "int")
      return _getInt(key) as T;
    else if (T.toString() == "String")
      return _getString(key) as T;
    else if (T.toString() == "double")
      return _getDouble(key) as T;
    else if (T.toString() == "bool")
      return _getBool(key) as T;
    else
      return "" as T;
  }
}
