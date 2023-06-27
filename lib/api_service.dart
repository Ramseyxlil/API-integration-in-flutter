import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  Future<dynamic> getUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users?page=2'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<dynamic> createUser(String name, String job) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/users'), body: {
        'name': name,
        'job': job,
      });
      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}
