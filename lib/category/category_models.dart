import 'package:equatable/equatable.dart';

class Category extends Equatable{
final String name;
final String imageUrl;
const Category({required this.name,required this.imageUrl});

  @override
  List<Object?> get props => [name,imageUrl];

static List<Category>categories=[
  const Category(name: 'Chairs', imageUrl: ('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-outdoor-chairs-1646349644.jpg?crop=0.505xw:1.00xh;0.236xw,0&resize=640:*')),
  const Category(name: 'Tables', imageUrl: ('https://m.media-amazon.com/images/I/81P33o3NQsL._AC_SL1500_.jpg')),
  const Category(name: 'Sofas', imageUrl: ('https://i.pinimg.com/originals/2b/82/6e/2b826edf976250a3f88e3b1ac8ccb999.jpg')),
  const Category(name: 'Home Accessories', imageUrl: ('https://www.pavilionbroadway.co.uk/media/catalog/tmp/category/luxury-home-accessories.jpg')),
];}