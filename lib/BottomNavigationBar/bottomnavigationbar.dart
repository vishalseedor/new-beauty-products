import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
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
  final pages = [
    const ProductScreen(),
    const CategoryScreen(),
    const CartScreen(),
    ProfileScreen()
  ];
  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Vishal V S'),
              accountEmail: Text('vishal123@gmail.com'),
              currentAccountPicture: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1464863979621-258859e62245?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3386&q=80'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
            )
          ],
        ),
      ),
      body: pages[currentPageIndex],
      bottomNavigationBar: Container(
        height: size.height*0.1,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, IconlyBold.home,'Home'),
              _buildNavItem(1, IconlyBold.category, 'Category'),
              _buildNavItem(2, IconlyBold.bag, 'Cart'),
              _buildNavItem(3, IconlyBold.profile, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentPageIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,color:currentPageIndex == index ? appcolor : Colors.grey),
          // Image.asset(
          //   assetPath,
          //   height: 30,
          //   width: 30,
          //   color: currentPageIndex == index ? appcolor : Colors.grey,
          // ),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: currentPageIndex == index ? appcolor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
