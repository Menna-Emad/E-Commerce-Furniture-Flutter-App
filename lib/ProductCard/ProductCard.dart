
import 'package:ecommerceapp/ProductCard/CardProducts.dart';
import 'package:ecommerceapp/ProductCard/productscreen.dart';
import 'package:ecommerceapp/Shopping_cart/cartbloc.dart';
import 'package:ecommerceapp/Shopping_cart/cartevent.dart';
import 'package:ecommerceapp/Shopping_cart/cartstate.dart';
import 'package:ecommerceapp/wishinglist/wishingBloc.dart';
import 'package:ecommerceapp/wishinglist/wishingstate.dart';
import 'package:ecommerceapp/wishinglist/wishlistEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget{
  final Product product;
  final bool isWishList;
  const ProductCard({required this.product, this.isWishList=false}) ;
  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen(product: product,)));
     },
     child: Stack(
       children: [
         Container(
           width: MediaQuery.of(context).size.width/2.5,
           height: 150,
           child: Image.network(product.imageUrl, ),
         ),
         Positioned(
           top: 150,
           child: Container(
             width: MediaQuery.of(context).size.width/2.5,
         height: 80,
         decoration: const BoxDecoration(
             color: Colors.transparent,
           ),)),
         Positioned(
           top: 100,
           left: 5,
           child: Container(
             width: MediaQuery.of(context).size.width/2.5-10,
             height: 60,
             decoration: BoxDecoration(
             color: Colors.deepPurple[200],
           ),
             child: Padding(
               padding: const EdgeInsets.only(bottom: 10),
               child: Row(
                 children: [
                   Expanded(
                     flex: 3,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:[
                         Text(product.name,
                           style:const TextStyle(color: Colors.white) ,),
                         Text('${product.price}',
                         style:const TextStyle(color: Colors.white) ,),

                       ], ),
                   ) ,
                   BlocBuilder<CartBloc,CartState>(
                     builder: (context,state){
                       if(state is CartLoading){
                         return Center(
                           child: CircularProgressIndicator(),
                         );
                       }
                       if(state is CartLoaded){
                         return Expanded(
                             child: IconButton(onPressed: (){
                               context
                                   .read<CartBloc>()
                                   .add(CartProductAdded(product));
                               final snackBar=SnackBar(content: Text('Added to your Cart'));
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             }, icon: const Icon(Icons.add_shopping_cart,color: Colors.white,)
                             ));
                       } else {
                         return Text('something went wrong');
                       }
                     }),
                   isWishList?
                   Expanded(
                       child: BlocBuilder<WishlistBloc,WishlistState>(
                         builder: (context,state) {
                           return IconButton(onPressed: () {
context.read<WishlistBloc>().add(RemoveWishlistProduct(product: product));
final snackBar=SnackBar(content: Text('Removed Item From Your WishList'));
ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }, icon: const Icon(
                                 Icons.delete, color: Colors.white,));

                         } )
                   ):const SizedBox() ],
               ),
             ),
           ),
         ),


       ],
     ),
   );
  }
}