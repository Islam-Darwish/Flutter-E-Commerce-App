import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/products_screen.dart';
import 'package:ecommerce_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController textController = TextEditingController();
  int pageIndex = 0;

  List<BottomNavigationBarItem> navBarsItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(
          Icons.home,
          color: Theme.of(context).accentColor,
        ),
        label: ('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        activeIcon: Icon(
          Icons.shopping_cart,
          color: Theme.of(context).accentColor,
        ),
        label: ('Cart'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        activeIcon: Icon(
          Icons.person,
          color: Theme.of(context).accentColor,
        ),
        label: ('Profile'),
      ),
    ];
  }

  Widget getScreen() {
    switch (pageIndex) {
      case 0:
        return ProductScreen();
      case 1:
        return CartScreen();
      case 2:
        return ProfileScreen();
      default:
        return MainScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
    );
    return Scaffold(
      appBar: pageIndex == 0
          ? AppBar(
              title: Container(
                child: Row(
                  children: [
                    Expanded(
                        child: AnimSearchBar(
                      width: 400,
                      textController: textController,
                      onSuffixTap: () {
                        setState(() {
                          textController.clear();
                        });
                      },
                    )),
                    Container(
                      height: AppBar().preferredSize.height - 8,
                      width: AppBar().preferredSize.height - 8,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : pageIndex == 1
              ? AppBar(
                  title: Text('Cart'),
                )
              : AppBar(
                  title: Text('Profile'),
                ),
      body: getScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: navBarsItems(),
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
      ),
    );
  }
}
