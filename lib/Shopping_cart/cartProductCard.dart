import 'package:ecommerceapp/ProductCard/CardProducts.dart';
import 'package:ecommerceapp/ProductCard/productscreen.dart';
import 'package:ecommerceapp/Shopping_cart/cartbloc.dart';
import 'package:ecommerceapp/Shopping_cart/cartevent.dart';
import 'package:ecommerceapp/Shopping_cart/cartstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget{
  final Product product;
  const CartProductCard({required this .product});

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.only(bottom: 0.8,top: 20,left: 30),
     child: Row(
       children: [
         Image.network(product.imageUrl,width: 100,height: 80,fit: BoxFit.cover,),
         SizedBox(width: 10,),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(product.name,style: Theme.of(context).textTheme.headline5,),
             Text('${product.price}',style: Theme.of(context).textTheme.headline5,),
             SizedBox(height: 10,),

             BlocBuilder<CartBloc,CartState>(
               builder: (context,state){
                return Row(
                  children: [
                    IconButton(onPressed: (){
                      context
                      .read<CartBloc>()
                          .add(CartProductRemoved(product));
                    }, icon: Icon(Icons.delete,color: Colors.orangeAccent,))

                  ],
                );
               }

             )
           ],
         ),

       ],
     ),
   );
  }
}