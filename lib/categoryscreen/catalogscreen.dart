
import 'package:ecommerceapp/ProductCard/CardProducts.dart';
import 'package:ecommerceapp/ProductCard/ProductCard.dart';
import 'package:ecommerceapp/Shopping_cart/cartscreen.dart';
import 'package:ecommerceapp/category/category_models.dart';
import 'package:ecommerceapp/wishinglist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogScreen extends StatelessWidget{
  static const String routeName='catalog';
  final Category category;
  const CatalogScreen({required this.category});
  @override
  Widget build(BuildContext context) {
    final List<Product>categoryProducts=
    Product.products.where((product)=>product.category==category.name).toList();
   return Scaffold(
     body: Column(
       children: [
     Padding(
     padding: const EdgeInsets.only(top: 40),
     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text('Furniture app', style: GoogleFonts.pacifico(
             color: Colors.black, fontSize: 25),),
         const SizedBox(width: 50,),
         IconButton(onPressed: () {},
             icon: Icon(
               Icons.notifications, color: Colors.orange[200],
               size: 30,)),
         IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>WishList()));
         }, icon: const Icon(Icons.favorite)),
         IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));}, icon: Icon(Icons.shopping_cart))

       ],),),
    const SizedBox(height: 10,),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white70,
    suffixIcon: const Icon(Icons.search),
    hintText: "search",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),)
    )
    ),
    ),
           Padding(
             padding: const EdgeInsets.only(right: 200,top: 10),
             child: Padding(
               padding: const EdgeInsets.only(left: 30),
               child: Text(category.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
             ),
           ),
           SizedBox(height: 15,),
           Expanded(
             child: GridView.builder(
               padding: const EdgeInsets.symmetric(horizontal:8.0,
               vertical: 16.0),
               gridDelegate:
               const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,childAspectRatio: 1.15),
               itemBuilder:(BuildContext context,int index){
              return Center(
                child:  ProductCard(
                product: categoryProducts[index],
              ) );
             },
    itemCount: categoryProducts.length,

             ),
           ),  ],
     ),);
  }
}