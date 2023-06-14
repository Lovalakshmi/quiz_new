import 'package:flutter/material.dart';
import 'package:quiz_1/screen/homescreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text.trim();
      String rollNo = _rollNoController.text.trim();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(name: name, rollNo: rollNo),
        ),
      );
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name.';
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'Name should only contain letters.';
    }
    return null;
  }

  String? _validateRollNo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your roll number.';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Roll number should only contain numbers.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: _validateName,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _rollNoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Roll No.'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
