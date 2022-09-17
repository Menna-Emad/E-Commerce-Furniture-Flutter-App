
import 'package:ecommerceapp/Shopping_cart/cartmodel.dart';
import 'package:ecommerceapp/Shopping_cart/cartscreen.dart';
import 'package:ecommerceapp/homepage.dart';
import 'package:ecommerceapp/wishinglist/wishlist.dart';
import 'package:flutter/material.dart';


class BottomNavBar extends StatefulWidget{
  static const String routeName='bottomNav';
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              currentPage = index;
              setState(() {

              });
            },
            currentIndex: currentPage,
            selectedIconTheme: IconThemeData(color: MythemeData.selectedColor),
            unselectedIconTheme:
            IconThemeData(color: MythemeData.unselectedColor),
            selectedLabelStyle: TextStyle(color: MythemeData.selectedColor),
           items: [
              BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,), label: '',),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart,size: 30,), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite,size: 30,), label: ''),
            ],


          ),
          body: getCurrentPage(),
        )
      ],
    );
  }

  Widget getCurrentPage() {
    if (currentPage == 0) {
      return HomePage();
    } else if(currentPage==1){
      return CartScreen();
    }else
      return WishList();
  }
}
class MythemeData{
  static final selectedColor= Colors.deepPurple;
  static final unselectedColor= Colors.black;
}