
import 'package:ecommerceapp/Shopping_cart/cartProductCard.dart';
import 'package:ecommerceapp/Shopping_cart/cartbloc.dart';
import 'package:ecommerceapp/Shopping_cart/cartstate.dart';
import 'package:ecommerceapp/wishinglist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget{
  static const String routeName='CartScreen';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.grey[200],
     appBar: AppBar(title:Text( 'Cart',style: GoogleFonts.pacifico(color: Colors.orangeAccent,fontSize: 40),),backgroundColor: Colors.grey[200],elevation: 0,centerTitle: true,
    actions: [
      IconButton(onPressed:(){}, icon:Icon(Icons.notifications,color: Colors.black,))
    ], ),
     body: BlocBuilder<CartBloc,CartState>(
       builder: (context,state){
         if(state is CartLoading){
           return Center(
             child: CircularProgressIndicator(),
           );
         }if (state is CartLoaded){
           return Padding(
             padding: const EdgeInsets.only(top: 10),
               child:
               Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:[
                   Column(
                     children: [
                       Text('*${state.cart.freeDeliveryString}*',style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.red),),

               SizedBox(
                   height: 400,
                   child:ListView.builder(
                     itemCount: state.cart.productQuantity(state.cart.products)
                     .keys.length,
                     itemBuilder: (context, int index){
                       return CartProductCard(
                         product: state.cart.products[index],);
                     },)),

               Column(
                 children: [
                   Divider(thickness: 2,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text
                               ('SubTotal',style: Theme.of(context).textTheme.headline6,),
                             Text ('${state.cart.subtotalString}',style: Theme.of(context).textTheme.headline6,)
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text
                               ('Delivery Fee',style: Theme.of(context).textTheme.headline6,),
                             Text ('${state.cart.deliveryFeeString}',style: Theme.of(context).textTheme.headline6,)
                           ],
                         ),
                       ],
                     ),
                   ),
                   Stack(
                     children: [
                       Container(
                         width: 250,
                         height: 60,
                         decoration: BoxDecoration(
                           color: Colors.deepPurple.withAlpha(50),
                         ),
                       ),
                       Container(
                         width: 250,
                         margin: const EdgeInsets.all(5.0),
                         height: 60,
                         decoration: BoxDecoration(
                           color: Colors.deepPurple.withAlpha(90),
                         ),
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal:30.0 ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text
                                 ('Total',style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
                               Text ('${state.cart.totalString}',style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
                             ],
                           ),
                         ),
                       ),

                     ],
                   )

                 ],
               ),
             ],
                   ),   ],) );
         }
         else {
           return Text('Something went wrong');
         }
       }
     ),);
  }
}