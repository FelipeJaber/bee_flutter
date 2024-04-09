import 'dart:convert';
import 'package:http/http.dart' as http;

class authFunctions{


  Future<String> authUser(String email, String passWord, String name) async {
    String apiUrl = 'http://localhost:8080/register';

    Map<String, String> body = {
      'email': email,
      'password': passWord,
      'name': name,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        String token = jsonResponse['token'];
        return token;
      } else {
        throw Exception('Erro ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      print(e);
      return "";
    }
  }

}