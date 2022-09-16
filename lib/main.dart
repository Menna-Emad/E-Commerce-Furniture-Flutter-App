import 'package:ecommerceapp/Shopping_cart/cartbloc.dart';
import 'package:ecommerceapp/Shopping_cart/cartevent.dart';
import 'package:ecommerceapp/Shopping_cart/cartscreen.dart';
import 'package:ecommerceapp/bottomNavBar.dart';
import 'package:ecommerceapp/homepage.dart';
import 'package:ecommerceapp/login.dart';
import 'package:ecommerceapp/signup.dart';
import 'package:ecommerceapp/startscreen.dart';
import 'package:ecommerceapp/wishinglist/wishingBloc.dart';
import 'package:ecommerceapp/wishinglist/wishlistEvent.dart';
import 'package:ecommerceapp/wishinglist/wishlistModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(_)=>WishlistBloc()..add(StarWishlist())),
        BlocProvider(create:(_)=>CartBloc()..add(CartStarted())),

      ],
      child: MaterialApp(
debugShowCheckedModeBanner: false,
           theme: ThemeData(
           ),
           routes: {
             HomePage.routeName: (buildContext) => HomePage(),
          SignUp.routeName:(buildContext)=>SignUp(),
             Login.routeName:(buildContext)=>Login(),
             StartScreen.routeName:(buildContext)=>StartScreen(),
             CartScreen.routeName:(buildContext)=>CartScreen(),
             BottomNavBar.routeName:(buildContext)=>BottomNavBar(),

           },
           initialRoute: BottomNavBar.routeName,
      ) );
  }
}

