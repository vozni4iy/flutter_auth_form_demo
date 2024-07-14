import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import '../widgets/input_decoration.dart';
import '../widgets/password_input_decoration.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isSubmitted = false;
  bool _isEmailValid = false;
  bool _isLengthValid = false;
  bool _isLetterCaseValid = false;
  bool _isDigitValid = false;
  bool _isPasswordVisible = false;

  void _validateEmail(String? value) {
    setState(() {
      _isEmailValid = value != null && value.isNotEmpty && isEmail(value);
    });
  }

  void _validatePassword(String value) {
    setState(() {
      _isLengthValid = value.length >= 8 && value.length <= 64;
      _isLetterCaseValid = RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(value);
      _isDigitValid = RegExp(r'(?=.*[0-9])').hasMatch(value);
    });
  }

  bool _validateForm() {
    _validateEmail(_email);
    _validatePassword(_password);
    return _isEmailValid && _isLengthValid && _isLetterCaseValid && _isDigitValid;
  }

  Color _getValidationColor(bool isValid) {
    if (!_isSubmitted) {
      return Colors.black;
    }
    return isValid ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter auth form demo'),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: inputDecoration('Email'),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    _validateEmail(value);
                    _email = value;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Email should be valid',
                      style: TextStyle(color: _getValidationColor(_isEmailValid)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: passwordInputDecoration('Password', _isPasswordVisible, () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  }),
                  obscureText: !_isPasswordVisible,
                  onChanged: (value) {
                    _validatePassword(value);
                    _password = value;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '8-64 characters (no spaces)',
                      style: TextStyle(color: _getValidationColor(_isLengthValid)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Lowercase and uppercase letters',
                      style: TextStyle(color: _getValidationColor(_isLetterCaseValid)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'At least 1 digit',
                      style: TextStyle(color: _getValidationColor(_isDigitValid)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isSubmitted = true;
                    });
                    if (_validateForm()) {
                      _formKey.currentState!.save();
                      _showSuccessDialog(context);
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Up Success'),
        content: const Text('You have successfully signed up!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
