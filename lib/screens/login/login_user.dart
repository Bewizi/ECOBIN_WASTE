import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> loginUser({
  required String email,
  required String password,
}) async {
  final url = Uri.parse('http://192.168.0.4/ecobin/api/login.php');

  final headers = {'Content-Type': 'application/json'};

  final body = json.encode({'email': email, 'password': password});

  final response = await http.post(url, headers: headers, body: body);

  final jsonResponse = json.decode(response.body);

  if (response.statusCode == 200) {
    return {
      'success': true,
      'message': jsonResponse['message'],
      'user': jsonResponse['user'],
    };
  } else {
    return {
      'success': false,
      'message': jsonResponse['message'] ?? 'Something went wrong',
    };
  }
}
