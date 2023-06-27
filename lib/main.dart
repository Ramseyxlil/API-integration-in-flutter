import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Integration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();

  String _response = '';

  void _getUsers() async {
    try {
      final response = await _apiService.getUsers();
      setState(() {
        _response = response.toString();
      });
    } catch (e) {
      setState(() {
        _response = e.toString();
      });
    }
  }

  void _createUser() async {
    try {
      final response = await _apiService.createUser('Izuafa Abdulrafiu', 'Developer');
      setState(() {
        _response = response.toString();
      });
    } catch (e) {
      setState(() {
        _response = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('API Integration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getUsers,
              child: Text('Get Users'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createUser,
              child: Text('Create User'),
            ),
            SizedBox(height: 16),
            Text(
              'API Response:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(_response),
          ],
        ),
      ),
    );
  }
}