import 'dart:convert';
import 'package:ecobin/shared/modal.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> registerUser({
  required String name,
  required String email,
  required String phone,
  required String password,
}) async {
  final url = Uri.parse('http://192.168.0.4/ecobin/api/register.php');

  final headers = {'Content-Type': 'application/json'};

  final body = json.encode({
    'name': name,
    'email': email,
    'phone': phone,
    'password': password,
  });

  final response = await http.post(url, headers: headers, body: body);

  final jsonResponse = json.decode(response.body);

  if (response.statusCode == 201) {
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
