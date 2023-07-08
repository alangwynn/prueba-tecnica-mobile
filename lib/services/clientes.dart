import 'package:http/http.dart' as http;

class Clientes {

  static Future<dynamic> getClientes() async {
    Uri url = Uri.parse('https://reqres.in/api/users');
    dynamic response = await http.get(
      url,
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );
    return response;
  }

}