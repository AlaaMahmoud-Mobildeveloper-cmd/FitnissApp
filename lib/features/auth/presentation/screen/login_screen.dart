import 'package:flutter/material.dart';
import 'package:omda_fit/features/auth/presentation/widget/fields_login.dart';

class LoginScreen extends StatefulWidget {
  static String routeName="LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isFormFilled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkFormFilled);
    _passwordController.addListener(_checkFormFilled);
  }

  void _checkFormFilled() {
    setState(() {
      _isFormFilled =
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login data is valid.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 460,
                    child: Image.asset('assets/images/IMG8.JPG', fit: BoxFit.cover),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 10,
                    bottom: 0,
                    child: IgnorePointer(
                      ignoring: true,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0xff000000),
                              Color.fromARGB(0, 14, 13, 13),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          Container(
                padding: const EdgeInsets.all(20),
        
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'اهلا بك',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'سجل دخولك للمتابعة',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      LoginTextField(
                        controller: _emailController,
                        label: 'Email',
                        hintText: 'Enter your email',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                      LoginTextField(
                        controller: _passwordController,
                        label: 'Password',
                        hintText: 'Enter your password',
                        icon: Icons.lock,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password is required';
                          }
                          if (value.trim().length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Forgot password tapped.'),
                              ),
                            );
                          },
                          child: const Text('Forgot password?'),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _isFormFilled ? _submit : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isFormFilled
                              ? Theme.of(context).primaryColor
                              : const Color.fromARGB(255, 35, 226, 10),
                          disabledBackgroundColor: Colors.grey.shade400,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: _isFormFilled ? Colors.white : Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
