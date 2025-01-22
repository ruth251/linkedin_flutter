import 'package:flutter/material.dart';



class SignInPage extends StatefulWidget{
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}


class _SignInPageState extends State<SignInPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const SizedBox(height: 5), // spacing from the top
          Image.asset(
            'assets/images/linkedin_offical_logo.png',
            width: 100.0,
            height: 100.0,
            ),
          
          const SizedBox(height: 15),
          Text(
            'Sign in',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
          )
        ]
      )
    );
    }
  }
