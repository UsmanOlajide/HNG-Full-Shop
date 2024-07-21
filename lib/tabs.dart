import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hype_kicks/screens/all_products_screen.dart';
import 'package:hype_kicks/screens/cart_screen.dart';
import 'package:hype_kicks/screens/home_screen.dart';
import 'package:hype_kicks/screens/my_orders_screen.dart';
import 'package:hype_kicks/screens/profile_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

const _screens = [
  HomeScreen(),
  AllProductsScreen(),
  CartScreen(),
  MyOrdersScreen(),
  ProfileScreen(),
];

class _TabsState extends State<Tabs> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle:
              WidgetStateProperty.all(Theme.of(context).textTheme.bodySmall),
        ),
        child: NavigationBar(
          height: 50,
          backgroundColor: Colors.transparent,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (i) => setState(() => _selectedIndex = i),
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset('assets/home_icon.svg'),
              label: 'Home',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/dashboard_icon.svg'),
              label: 'All products',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/cart_icon.svg'),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/order_icon.svg'),
              label: 'My Orders',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/acc_icon.svg'),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
