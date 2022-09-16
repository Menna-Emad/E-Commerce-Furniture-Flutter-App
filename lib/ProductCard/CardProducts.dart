import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable{
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  final Color color;
  final String description;

  const Product({required this.name
    ,required this.category,
    required this.imageUrl,
    required this.isPopular,
    required this.isRecommended,
    required this.price,
    required this.color,
    required this.description});

  @override
  List<Object?> get props =>[
    name,
    category,
    imageUrl,
    price,
    isPopular,
    isRecommended,
    color,
    description
  ] ;
  static List<Product>products=[
     Product(
        name: 'Arm chairs',
        category: 'Chairs',color:
        Colors.grey,
        imageUrl: 'https://cdn.shopify.com/s/files/1/2660/5106/products/96C08670_Piper_Chair_3Q_1400x.jpg?v=1608315863',
        isPopular: false,
        isRecommended: true,
        price: 22.99 ,
        description:'Finnish-American architect and designer Eero Saarinen famously hated the sight of many table and chair legs in a room'  ),
     Product(
        name: 'Mirrors',
        category: 'Home Accessories',
        color: Color.fromRGBO(148, 106, 46, 1),
        imageUrl: 'https://kemittupload.s3.eu-central-1.amazonaws.com/img/product/images-1646651352564.jpg',
        isPopular: false,
        isRecommended: true,
        price: 22.99,
        description: 'Mirror is an elegant and stylish mirror. The mirror has an eye catching and sculpturally design, that fits into the modern home. The mirror is available in two sizes and has a practical shelf in oak with the possibility for storage. '),
     Product(
        name: 'Wooden table',
        category: 'Tables',
        color: Colors.brown,
        imageUrl: 'https://m.media-amazon.com/images/I/91jF7-2K5xL._AC_SL1500_.jpg',
        isPopular: false,
        isRecommended: true,
        price: 22.99 ,
        description: ' Sturdy and easy to assemble with a light and handcrafted look'),
     Product(
        name: 'Sofa',
        category: 'Sofas',
        color: Color.fromRGBO(49, 65, 96, 1),
        imageUrl: 'https://eg.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/27/692422/1.jpg?7943',
        isPopular: false,
        isRecommended: true,
        price: 22.99 ,
        description: 'Simple wash free technology cloth art living room sofa home living room furniture modern Italian light luxury sofa combination'),
     Product(
        name: 'Tufted chairs', category: 'Chairs',
        color:Color.fromRGBO(57, 107, 116, 1),
        imageUrl: 'https://cdn.shopify.com/s/files/1/0377/5909/0821/products/WhatsAppImage2020-09-29at12.58._720x.jpg?v=1612261409',
        isPopular: false,
        isRecommended: true,
        price: 22.99 ,
        description:'Given that the Ming dynasty ruled China from 1368 to 1644, theres a wide range of furniture styles from the period. Towards the later years, though, the nation saw the production of intricate, carved wood furniture, much of it produced'),



    Product(name: 'Pink Sofa',
        category: 'Sofas',
        imageUrl: 'https://cdn.shopify.com/s/files/1/0096/4594/9013/products/2-SeaterSofaSetLightPinkVelvetLoungeCouch-1.jpg?v=1630305682',
        isPopular: true,
        isRecommended: false,
        price: 100.00,
        color: Color.fromRGBO(211, 162, 166, 1),
        description: 'Newly designed catalog featuring all of our seductive designs.'),

    Product(name: 'Dining Table',
        category: 'Tables',
        imageUrl: 'https://d13r0hznkpv24o.cloudfront.net/media/catalog/product/cache/e9da42a1907d51557ab3b33bb058386d/e/m/em-tunahan-dn-beauty-2.png',
        isPopular: true,
        isRecommended: false,
        price: 80.99,
        color: Color.fromRGBO(77, 69, 62, 1),
        description: 'Style	Modern Suitable for	Indoor useRoom	Dining Room'),



    Product(
        name:'Shearling Chair',category: 'chairs',
      color: Color.fromRGBO(130, 88, 49, 1),
      imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/zara-faux-shearling-chair-1654548559.jpeg?crop=1.00xw:0.668xh;0,0.258xh&resize=768:*',
      isPopular: true,
      isRecommended: false,
      price: 50.99,
      description: 'If you want something in particular, Wayfair probably has it, and at a cant-beat price to top it off. There you willll find hundreds and hundreds of options for pretty much every item imaginable, '
    ),

    Product(name:'Hanging Chair-Black ' ,
        category: 'Chairs',
        imageUrl: 'https://eg.homzmart.net/catalog/product/0/0/0031_3.jpg',
        isPopular: true,
        isRecommended: false,
        price: 40.00,
        color: Colors.grey,
        description: 'Enrich your outdoor décor with this trendy chair, which will add a modern touch to your space. It is made of pure rattan plastic with metal frame 7/10 mm and electrostatic painting'),

    ];

  

}