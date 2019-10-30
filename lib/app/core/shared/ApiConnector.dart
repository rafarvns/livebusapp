
import 'package:http/http.dart' as http;

class ApiConnector {

  static const _apiPath = "http://10.0.2.2:8080/api/";
  int _connectionStatus;

  Future<String> get(String url) async {
    var response = await http.get(_apiPath+url);
    return response.body;
  }
  
}


