// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outliers/Login%20Page.dart';

import 'HomePage.dart';
void main() {
  runApp(const signup());
  Firebase.initializeApp();
}


class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}
// void toast()  {
// Fluttertoast.showToast(
// msg: "Logged In Successfully",  // message
// toastLength: Toast.LENGTH_SHORT, // length
// gravity: ToastGravity.CENTER,    // location
// timeInSecForIosWeb: 1               // duration
// );
// }
class _LoginDemoState extends State<LoginDemo> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void update()
    {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          // username:usernameController,
          email: emailController.text,
          password: passwordController.text)
          .then((value) {
        print("Created New Account");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Home()));
      }).onError((error, stackTrace) {
        print("Error ${error.toString()}");
      });
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:const Color.fromRGBO(130, 32, 92,1) ,
        title: const Text("SignUp Page"),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 150,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/sandclock.jpeg')),
              ),
            ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    labelText: 'UserName',
                    hintText: 'Enter Your Name'),

              ),

            ),Column(
              children: const <Widget>[

                SizedBox(height: 20),

              ],
            ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Column(
              children: const <Widget>[

                SizedBox(height: 7),

              ],
            ),
             Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),

            ),
            // TextButton(
            //   onPressed: (){
            //
            //     //TODO FORGOT PASSWORD SCREEN GOES HERE
            //   },
            //   child: const Text(
            //     'Forgot Password',
            //     style: TextStyle(color: Color.fromRGBO(130, 32, 92,1), fontSize: 15),
            //   ),
            // ),
            Column(
              children: const <Widget>[

                SizedBox(height: 7),

              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    labelText: ' Confirm Password',
                    hintText: 'Enter The Same  Password To Confirm'),
              ),

            ),
            Column(
              children: const <Widget>[

                SizedBox(height: 20),

              ],
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(130, 32, 92,1), borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  update();

                },
                child: const Text(
                  'SignUp',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
      TextButton(
          onPressed: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const login()));
          },
          child: const Text(
            'Already a User ? Log In',
            style: TextStyle(color: Color.fromRGBO(130, 32, 92,1), fontSize: 15),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
