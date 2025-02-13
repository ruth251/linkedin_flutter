import 'package:flutter/material.dart';
import 'package:linkedin_flutter/screens/authentication/sign_up/add_name.dart';
import 'package:linkedin_flutter/routes/app_routes.dart';
import 'package:linkedin_flutter/screens/authentication/sign_up/sign_up.dart';

class SetEmailPass extends StatefulWidget {
  const SetEmailPass({Key? key}) : super(key: key);

  @override
  State<SetEmailPass> createState() => _SetEmailPassState();
}

class _SetEmailPassState extends State<SetEmailPass> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool _isButtonEnabled = false;

  void _validateInputs() {
    setState(() {
      _isButtonEnabled = _isEmailValid && _passwordController.text.length >= 8;
    });
  }

  String? _validateEmail(String? value) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || value.isEmpty) {
      return "Please enter your email.";
    }
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address.";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password.";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters.";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      final isValid = _validateEmail(_emailController.text) == null;
      if (_isEmailValid != isValid) {
        setState(() {
          _isEmailValid = isValid;
          _passwordController.clear(); // Reset password field when email changes
        });
      }
      _validateInputs();
    });

    _passwordController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50), // Spacing for status bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button
                IconButton(
                  icon: const Icon(Icons.arrow_back, size: 28),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                builder: (context) => const AddName(),
                ),
              );
                  },
                ),
                // Close Button
                IconButton(
                  icon: const Icon(Icons.close, size: 28),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context) => const SignUp(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Title
            const Text(
              "Set your Email and Password",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 15),
                  // Password Field (only visible if email is valid)
                  if (_isEmailValid)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: TextButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              child: Text(
                                _isPasswordVisible ? "Hide" : "Show",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          validator: _validatePassword,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Password must be 8+ characters",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  const SizedBox(height: 15),
                  // Remember Me Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        "Remember me.",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          print('Learn more tapped');
                        },
                        child: const Text(
                          'Learn more',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isButtonEnabled
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                print("Continue button clicked");
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isButtonEnabled
                            ? Colors.blue
                            : Colors.blue.withAlpha((0.5 * 255).round()),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
