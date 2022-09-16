import 'package:ecommerceapp/ProductCard/CardProducts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Cart extends Equatable{
  final List<Product>products;
const Cart({this.products=const <Product>[]});
double get subtotal=>products.fold(0,(total,current)=>total+current.price);

double deliveryFee(subtotal){
  if(subtotal>=30.0){
    return 0.0;
  }else
    return 10.0;
}

double total(subtotal,deliverFee){
 return subtotal+deliverFee(subtotal);
}

String freeDelivery(subtotal){
  if(subtotal>=30.0){
    return 'you have free Delivery';
  }else{
    double missing =30.0-subtotal;
    return 'Add ${missing.toStringAsFixed(2)} for Free Delivery';
  }
}


String get totalString=>total(subtotal,deliveryFee).toStringAsFixed(2);
String get subtotalString=>subtotal.toStringAsFixed(2);
String get deliveryFeeString=>deliveryFee(subtotal).toStringAsFixed(2);
String get freeDeliveryString=>freeDelivery(subtotal);

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
