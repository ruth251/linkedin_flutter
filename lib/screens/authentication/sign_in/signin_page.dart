import 'package:flutter/material.dart';



class SignInPage extends StatefulWidget{
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}


class _SignInPageState extends State<SignInPage>{

  bool isChecked = false;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        
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
            )
          ),

          const SizedBox(height:5),
          RichText(
            text: TextSpan(
              text: 'or ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black
              ),

            children: [
            TextSpan(
              text: 'Join Linkedin',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              )

// we will have to add navigation code here to take us to the join linkedin i.e. signup page
            )
          ],
            ),
          ),

          const SizedBox(height:15),
          // Butttons
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: OutlinedButton(
            onPressed: (){
              print('Sign in with Google clicked');
          }, 
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black, width: 1) ,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), //rounded corners
            ),
            padding: const EdgeInsets.symmetric(vertical: 10), //button padding

          ),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
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

                )
              ),
            ],
          )
          )
          ),

          const SizedBox(height:12),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child:
          OutlinedButton(
            onPressed: (){
              print('Sign in with Google clicked');
          }, 
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black, width: 1) ,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), //rounded corners
            ),
            padding: const EdgeInsets.symmetric(vertical: 10), //button padding

          ),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
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

                )
              ),
            ],
          )
          )
          ),

          const SizedBox(height:12),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: OutlinedButton(
            onPressed: (){
              print('Sign in Facebook clicked');
            },
            style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black, width: 1) ,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), //rounded corners
            ),
            padding: const EdgeInsets.symmetric(vertical: 10), //button padding

          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
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

                )
              ),
            ],
          ) 
            ),
          ),

          const SizedBox(height:15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'or',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                )
              ),

              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
              )
            ],
          )
          ),

          const SizedBox(height:15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Email Text Form Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email or Phone',
                  hintText: 'Email or Phone',
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),

                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),

                  focusedBorder: const UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  
                  
                ),

                keyboardType: TextInputType.emailAddress, // Email keyboard

              ),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),

                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),

                  focusedBorder: const UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.black, width: 1),
          ),

                  suffixIcon: Icon(Icons.visibility),
                  // onPressed: (){
                  //   print('Toggle password visibility');
                  // },
                ),
                obscureText: true, //to hide password input
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Colors.green,
                    onChanged: (bool? value){
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),

                  const Text(
                    "Remember me.",
                    style: TextStyle(fontSize: 17),
                  ),

                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap:  (){
                      print('Learn more tapped');
                    },
                    child: const Text(
                      'Learn more',
                      style:TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),

                  const SizedBox(height: 10),

                  

                ],
              ),

              //Forgot Passsword

                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        print('Forgot password tapped');
                      }, 
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )
                      )),
                  ),

                  const SizedBox(height: 5),

                OutlinedButton(
                  onPressed: (){
                    print('Continue button clicked');},
                    child: Text('Continue'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), //rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10), 
                      minimumSize: const Size(double.infinity, 50), //button padding
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

                    ),
               
            
            

          ),

            ],
          ),
        ),
          
        ]
        

      )
      )
    );
    }
  }



































