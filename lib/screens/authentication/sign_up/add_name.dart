import 'package:flutter/material.dart';
import 'package:linkedin_flutter/screens/authentication/sign_up/email_password.dart';
import 'package:linkedin_flutter/screens/authentication/sign_up/sign_up.dart';


class AddName extends StatefulWidget {
  const AddName({Key? key}) : super(key: key);

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool _isButtonEnabled = false;

  void _validateInputs() {
    setState(() {
      _isButtonEnabled = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_validateInputs);
    _lastNameController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
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
                // LinkedIn Logo (Left)
                Image.asset(
                  'assets/images/linkedin_offical_logo.png',
                  width: 100,
                  height: 100,
                ),
                // Close Button (Right)
                IconButton(
                  icon: const Icon(Icons.close, size: 28),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const SignUp()
                      ),
                      );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Title
            const Text(
              "Add your name",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Form Fields
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: "First Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your first name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your last name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isButtonEnabled
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const SetEmailPass(),
                                 ),
                               );
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isButtonEnabled
                            ? Colors.blue
                            : Colors.blue.withAlpha(128),
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
