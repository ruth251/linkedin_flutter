import 'package:flutter/material.dart';
import 'package:linkedin_flutter/screens/authentication/forgot_password/forgot_password.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>(); // Form Key for validation
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;
  bool isPasswordVisible = false;

  // Email Validation Function (Regex)
  String? validateEmail(String? value) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); // Email pattern
    if (value == null || value.isEmpty) {
      return "Please enter your email or phone.";
    }
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address.";
    }
    return null;
  }

  // Password Validation Function (Regex)
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password.";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey, // Wrap in a Form Widget
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2), // spacing from the top
                Image.asset(
                  'assets/images/linkedin_offical_logo.png',
                  width: 100.0,
                  height: 100.0,
                ),
                const SizedBox(height: 10),
                Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'or ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print('Join Linkedin tapped');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                      ),
                      child: Text(
                        "Join Linkedin",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Social Media Buttons (Unmodified)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: OutlinedButton(
                    onPressed: () {
                      print('Sign in with Google clicked');
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google_icon.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: OutlinedButton(
                    onPressed: () {
                      print('Sign in with Apple clicked');
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/apple_icon.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Sign in with Apple',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: OutlinedButton(
                    onPressed: () {
                      print('Sign in with Facebook clicked');
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/facebook_icon.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Sign in with Facebook',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),



                const SizedBox(height: 20),

                // Divider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'or',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // Email Text Field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email or Phone',
                    hintText: 'Email or Phone',
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                ),

                // Password Text Field
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: UnderlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !isPasswordVisible,
                  validator: validatePassword,
                ),

                const SizedBox(height: 15),

                // Forgot Password
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Continue Button with Validation
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Form is valid, proceed with sign in');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    minimumSize: const Size(double.infinity, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue.shade700,
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
