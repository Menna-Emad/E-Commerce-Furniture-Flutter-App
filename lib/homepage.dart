import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/ProductCard/CardProducts.dart';
import 'package:ecommerceapp/ProductCard/productCarousel.dart';
import 'package:ecommerceapp/Shopping_cart/cartscreen.dart';
import 'package:ecommerceapp/categoryscreen/catalogscreen.dart';
import 'package:ecommerceapp/login.dart';
import 'package:ecommerceapp/slidecard.dart';
import 'package:ecommerceapp/wishinglist/wishlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerceapp/category/category_models.dart';


class HomePage extends StatefulWidget{
  static const String routeName='home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 10,right: 5),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text('Furniture app', style: GoogleFonts.pacifico(
                        color: Colors.black, fontSize: 25),),
                    SizedBox(width: 90,),
                    IconButton(onPressed: () {},
                        icon: Icon(
                          Icons.notifications, color: Colors.orange[200],
                          size: 30,)),
                  ],),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    suffixIcon: Icon(Icons.search),
                    hintText: "search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),)
                )
                ),
              ),
              Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items:Category.categories.map((category)=>SlideCard(category: category)).toList(),
                  )),


                 Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align(
                      alignment: Alignment.topLeft,
                      child:
                      Text('Recommended',style: TextStyle(fontSize: 20),),
                      ),
                      ),
              ProductCarousel(
    products:Product.products
        .where((product) => product.isRecommended)
        .toList(),
              ),

                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
                         child: Align(
                           alignment: Alignment.topLeft,
                           child:
                           Text('Most Popular',style: TextStyle(fontSize: 20),),
                         ),
                       ),
                       ProductCarousel(
                           products:Product.products.where((product) => product.isPopular).toList(),
                       )

                     ],
                   )));
  }}

