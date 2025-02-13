import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>(); // Form Key for validation
  final TextEditingController _emailController = TextEditingController();

  String? _validateEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Email or phone number is required.";
    }
    // Regular expression for email validation
    final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    final RegExp phoneRegex = RegExp(r"^\d{10,15}$");

    if (emailRegex.hasMatch(value) || phoneRegex.hasMatch(value)) {
      return null;
    } else {
      return "Enter a valid email or phone number";
    }
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey, // Assigning form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20), // Adjust spacing from the top
              // LinkedIn Logo (Left Aligned)
              Align(
                alignment: Alignment.centerLeft, // Moves the logo to the left corner
                child: Image.asset(
                  'assets/images/linkedin_offical_logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              // Forgot Password Text
              const Text(
                "Forgot password",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Email Input Field with Validation
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email or Phone",
                  hintText: "Enter your email or phone",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmailOrPhone, // Email validation function
              ),
              const SizedBox(height: 15),
              // Instruction Text
              const Text(
                "We’ll send a verification code to this email or phone number if it matches an existing LinkedIn account.",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              const SizedBox(height: 30),
              // Next Button with Validation Check
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, "/main");
                    } else {
                      print("Invalid email or phone number");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
