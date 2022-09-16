import 'package:ecommerceapp/login.dart';
import 'package:ecommerceapp/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget{
  static const String routeName='StartScreen';
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      body:
      SafeArea(
        child: Column(
          children: [
            Expanded(flex: 2,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Image.asset('assets/images/home.jpg',fit: BoxFit.fill,)),
            ),

        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              color: Colors.orange[200],
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Column(
                    children: [
                      Text('Furniture App',style: GoogleFonts.pacifico(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(top: 200,right: 30,left: 30),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Expanded(

                                flex: 1,
                                child: ElevatedButton(
                                  style:ElevatedButton.styleFrom(
                                    minimumSize: Size.square(40.0),
                                    primary:
                                    Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ) ,
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (buildContext)=>Login()));
                                  }, child:Text('Login') ,
                                )),
                            SizedBox(width: 10,),
                            Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                  style:ElevatedButton.styleFrom(
                                    minimumSize: Size.square(40.0),
                                    primary:
                                    Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ) ,
                                  onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (buildContext)=>SignUp()));}, child:Text('SignUp') ,
                                )),
                          ],
                        ),
                      ) , ],
                  ),
                ),
              ),

            ),
          ),
        )
          ],
        ),
      )
    );
  }
}