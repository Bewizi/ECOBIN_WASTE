import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  // base url
  final baseUrl = 'http://192.168.100.114:8000/api';

  // login server
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/v1/login'),
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
        Uri.parse('$baseUrl/v1/register'),
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

  // logout
  Future<Map<String, dynamic>> logout() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/v1/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      final data = jsonDecode(response.body);
      print('Logout Response: $data');
      if (response.statusCode == 200) {
        return {'success': true, 'message': data['message']};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Logout failed',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Server error: $e'};
    }
  }
}
