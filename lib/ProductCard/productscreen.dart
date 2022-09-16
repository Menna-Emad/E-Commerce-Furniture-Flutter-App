import 'package:ecommerceapp/ProductCard/CardProducts.dart';
import 'package:ecommerceapp/Shopping_cart/cartbloc.dart';
import 'package:ecommerceapp/Shopping_cart/cartevent.dart';
import 'package:ecommerceapp/Shopping_cart/cartscreen.dart';
import 'package:ecommerceapp/Shopping_cart/cartstate.dart';
import 'package:ecommerceapp/wishinglist/wishingBloc.dart';
import 'package:ecommerceapp/wishinglist/wishingstate.dart';
import 'package:ecommerceapp/wishinglist/wishlist.dart';
import 'package:ecommerceapp/wishinglist/wishlistEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget{
  static const String routeName='product';
final Product product;
const ProductScreen({required this.product});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
backgroundColor:product.color ,
appBar: AppBar(backgroundColor: product.color,elevation: 0,title:Text (product.name,style:Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
    leading:IconButton(icon: Icon(Icons.arrow_back), onPressed: () =>Navigator.pop(context),),
    actions:<Widget>[
    IconButton(icon: Icon(Icons.search), onPressed: () { },),
   IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>WishList()));}, icon: Icon(Icons.favorite)) ]
),
body: SingleChildScrollView(
  child: Column(
    children: [
      SizedBox(height: size.height,
        child: Stack(
          children: [
            Container(
              margin:EdgeInsets.only(top: size.height*0.3) ,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24))
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 100),
              child: Column(
                children: [
                  Row(
  children: [
    RichText(text: TextSpan(children: [
      TextSpan(text: 'Price\n'),
      TextSpan(text: '${product.price}',
        style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
      )
    ])),
    SizedBox(height: 20,width: 40,),
    Expanded(child:Image.network(product.imageUrl), )
  ],

),
     Column(
       children: [
         Row(
           children: [
             Column(
               children: [
                 Text('Color',style:TextStyle( color:Colors.black,fontSize: 30)),
                 Container(
                   padding: EdgeInsets.all(2.5),
                   height: 24,width: 24,
                   decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
               child:DecoratedBox(
                 decoration:
                 BoxDecoration(color: product.color,shape: BoxShape.circle),
               ) ,
                 ),
               ],
             )
           ],
         ),
SizedBox(height: 20,),
Container(
  child: Text(product.description),
),
         Padding(
           padding: const EdgeInsets.only(top: 30),
           child: Row(
             children: [
               CardCounter(),
               SizedBox(width: 30,),
               BlocBuilder<WishlistBloc,WishlistState>(
                 builder: (context,state) {
                   return IconButton(onPressed: () {
context
    .read<WishlistBloc>()
    .add(AddWishlistProduct(product: product));
final snackBar=SnackBar(content: Text('Added to your WishList'));
ScaffoldMessenger.of(context).showSnackBar(snackBar);
                   },icon: Icon(Icons.favorite, color: Colors.orangeAccent, size: 35,));
                 } ),
               SizedBox(width: 30,),

               BlocBuilder<CartBloc,CartState>(
                 builder: (context,state){
                   if(state is CartLoading){
                     return Center(
                       child: CircularProgressIndicator(),
                     );
                   }
                   if(state is CartLoaded){
                     return  IconButton(onPressed: (){

                       context
                           .read<CartBloc>()
                           .add(CartProductAdded(product));
                       final snackBar=SnackBar(content: Text('Added to your Cart'));
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                     }, icon: Icon(Icons.add_shopping_cart,size: 35,));

                   } else {
                     return Text('something went wrong');
                   }
                   })
             ],
           ),
         ),
         SizedBox(height: 30,),
         Container(
           width: 250,
           height: 50,
           child: ElevatedButton(
               style: ElevatedButton.styleFrom(
             primary:
             Colors.orangeAccent.withOpacity(0.5),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10.0),
             ),
           ),
               onPressed: (){}, child: Text('Buy Now',style: TextStyle(fontSize: 30),)),
         )
       ],
     )
                ],
              ),
            ),
          ],
        ),
      )
    ],
  ),
)
    );
  }
}
class CardCounter extends StatefulWidget{
  @override
  State<CardCounter> createState() => _CardCounterState();
}

class _CardCounterState extends State<CardCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(icon: Icons.remove, press: () {
          if (numOfItems > 1) {
            setState(() {
              numOfItems--;
            });
          }
        }),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              numOfItems.toString().padLeft(2, '0')
              , style: Theme
                .of(context)
                .textTheme
                .headline6,)
        ),
        buildOutlineButton(icon: Icons.add, press: () {
          setState(() {
            numOfItems++;
          });
        }),
      ],
    );
  }

  SizedBox buildOutlineButton({ IconData? icon,  VoidCallback? press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
          style: ButtonStyle(
          shape:MaterialStateProperty.all( RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13))
          )  ),
        onPressed:press,
        child:Icon(icon),
      ),
    );
  }
}