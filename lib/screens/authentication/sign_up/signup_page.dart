import 'package:flutter/material.dart';



class SignUpPage extends StatefulWidget{
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}


class _SignUpPageState extends State<SignUpPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const SizedBox(height: 50), // spacing from the top
          Image.asset(
            'assets/images/linkedin_offical_logo.png',
            width: 30.0,
            height: 30.0,
            ),
          
          const SizedBox(height: 50),
          Text(
            'Sign in',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
          )
        ]
      )
    );
    }
  }
