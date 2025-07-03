import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  // base url
  final baseUrl = 'http://192.168.0.4:8000/api';

  // login server
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'email': email, 'password': password}),
      );
      final data = jsonDecode(response.body);
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        print('Status Code: ${response.statusCode}');
        return {
          'success': true,
          'message': data['message'],
          'user': data['user'],
          'token': data['token'],
        };
      } else {
        return {
          'success': false,
          'message':
              data['error'] ??
              (data['errors']?.values.first[0] ?? 'Login Failed'),
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Server Error: $e'};
    }
  }

  // register server
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        }),
      );
      final data = jsonDecode(response.body);
      print('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        print('Status Code: ${response.statusCode}');
        return {
          'success': true,
          'message': data['message'],
          'user': data['user'],
          'token': data['token'],
        };
      } else {
        return {
          'success': false,
          'message': data['errors']?.values.first[0] ?? 'Registration failed',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Server error: $e'};
    }
  }
}
