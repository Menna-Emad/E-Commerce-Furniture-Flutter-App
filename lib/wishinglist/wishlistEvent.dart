
import 'package:ecommerceapp/ProductCard/CardProducts.dart';
import 'package:equatable/equatable.dart';

abstract class WishlistEvent extends Equatable{
  const WishlistEvent();
  @override
  List<Object>get props=>[];
}
class StarWishlist extends WishlistEvent{}
class AddWishlistProduct extends WishlistEvent{
  final Product product;
  const AddWishlistProduct({required this.product});
  @override
  List<Object>get props=>[product];
}
class RemoveWishlistProduct extends WishlistEvent{
  final Product product;
  const RemoveWishlistProduct({required this.product});
  @override
  List<Object>get props=>[product];
}