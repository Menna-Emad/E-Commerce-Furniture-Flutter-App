import 'package:ecommerceapp/alert.dart';
import 'package:ecommerceapp/bottomNavBar.dart';
import 'package:ecommerceapp/homepage.dart';
import 'package:ecommerceapp/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  static const String routeName = 'login';
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  signIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata!.save();
      try {
        showLoading(context);
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("No user found for that email"))
            ..show();
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("Wrong password provided for that user"))
            ..show();
        }
      }
    } else {
      print("Not Vaild");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200,left:   10),
                child: Row(
                  children: [
                    Text('Shopping in your',style:GoogleFonts.pacifico(fontSize: 30)),
                 SizedBox(width: 5),
                 Text('Pocket',style:
                 GoogleFonts.pacifico(fontSize: 35,color: Colors.deepPurple),),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (val) {
                            myemail = val;
                          },
                          validator: (val) {
                            if (val!.length > 100) {
                              return "Email can't to be larger than 100 letter";
                            }
                            if (val.length < 2) {
                              return "Email can't to be less than 2 letter";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,

                              prefixIcon: Icon(Icons.person),
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onSaved: (val) {
                            mypassword = val;
                          },
                          validator: (val) {
                            if (val!.length > 100) {
                              return "Password can't to be larger than 100 letter";
                            }
                            if (val.length < 4) {
                              return "Password can't to be less than 4 letter";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                              prefixIcon: Icon(Icons.lock),
                              hintText: "password",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          width: 5,
                          height: 35,
                        ),
                        Container(
                            width: 300,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:
                                Colors.deepPurple.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () async {
                                var user = await signIn();
                                if (user != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BottomNavBar()));
                                }
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(color: Colors.white,fontSize: 20),
                              ),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10,),
                            Text("Or continue with"),
                          ],
                        ),
                        SizedBox.fromSize(
                          size: Size(56, 56), // button width and height
                          child: Material(
                            color: Colors.transparent, // button color
                            child: InkWell(
                              splashColor: Colors.deepPurple
                                  .withOpacity(0.5), // splash color
                              onTap: Login, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.google), // icon
                                  Text("Google"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(

                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(child: Text("Not a member? ")),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text(
                                    "Register now",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                )
                              ],
                            )),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future Login() async {
    await GoogleSignInApi.login();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}