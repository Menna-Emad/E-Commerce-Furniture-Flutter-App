
import 'package:ecommerceapp/ProductCard/ProductCard.dart';
import 'package:ecommerceapp/Shopping_cart/cartscreen.dart';
import 'package:ecommerceapp/wishinglist/wishingBloc.dart';
import 'package:ecommerceapp/wishinglist/wishingstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';



class WishList extends StatelessWidget{
  static const String routeName='Wish';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Wishing List',style: GoogleFonts.pacifico(color: Colors.orangeAccent,fontSize: 25),),centerTitle: true,backgroundColor: Colors.grey[200],elevation: 0,
        leading:
      IconButton(icon:Icon( Icons.arrow_back),color: Colors.orangeAccent,onPressed: (){Navigator.pop(context);},),
      actions: [
        IconButton(onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
        }, icon:Icon(Icons.shopping_cart,color: Colors.black,)),
        IconButton(onPressed:(){}, icon:Icon(Icons.notifications,color: Colors.black,))
      ],),

      body: BlocBuilder<WishlistBloc,WishlistState>(
        builder: (context,state) {
          if(state is WishlistLoading){
          return const Center(
            child: CircularProgressIndicator(),);
          };
          if (state is WishlistLoaded ){
    return GridView.builder(
    padding: const EdgeInsets.symmetric(horizontal:8.0,
    vertical: 16.0),
    gridDelegate:
    const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,childAspectRatio: 1.15),
    itemBuilder:(BuildContext context,int index){
    return Center(
    child: ProductCard(
    product: state.wishlist.products[index],
    isWishList: true,
    ) );
    },
    itemCount: state.wishlist.products.length,

    );
    } else {
            return const Text('Something went wrong');
          }
   },
      ),
    );
  }
}