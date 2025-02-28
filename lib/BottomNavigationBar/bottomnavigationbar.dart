
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/CartScreen/pages/cartscreen.dart';
import 'package:new_diy_beauty_products/CategoryScreen/pages/categoryscreen.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ProductScreen/homescreen.dart';
import 'package:new_diy_beauty_products/ProfileScreen/profilescreen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [const ProductScreen(),const CategoryScreen(), const CartScreen(),ProfileScreen()];
  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: Text('Vishal V S'), accountEmail: Text('vishal123@gmail.com'),currentAccountPicture: CircleAvatar(radius:60,backgroundImage: NetworkImage('https://images.unsplash.com/photo-1464863979621-258859e62245?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3386&q=80'),)),
            ListTile(leading: Icon(Icons.person),title: Text('My Profile'),)
          ],
        ),
      ),
      // appBar: AppBar(
      //   centerTitle: false,
      //   leading: IconButton.filledTonal(
      //     onPressed: () {
      //       _scaffoldKey.currentState?.openDrawer();
      //     },
      //     icon: const Icon(Icons.menu),
      //   ),
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         "Hi Vishal👋🏾",
      //         style: Theme.of(context).textTheme.titleMedium,
      //       ),
      //       Text("Enjoy our services", style: Theme.of(context).textTheme.bodySmall)
      //     ],
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 8.0),
           
      //     ),
      //   ],
      // ),
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
   selectedItemColor: appcolor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon:Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face_outlined),
            label: "Category",
            activeIcon: Icon(Icons.face_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
            activeIcon:  Icon(Icons.shopping_bag),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
