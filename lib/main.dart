import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hype_kicks/screens/cart_screen.dart';
import 'package:hype_kicks/screens/order_history_screen.dart';
import 'package:hype_kicks/screens/payment_successful_screen.dart';
import 'package:hype_kicks/screens/shoe_details_screen.dart';
import 'package:hype_kicks/screens/wishlist_screen.dart';
import 'package:hype_kicks/services/cache_service.dart';
import 'package:hype_kicks/tabs.dart';
import 'package:hype_kicks/test.dart';
import 'package:hype_kicks/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // CacheService();
  await dotenv.load();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hyper Kicks',
      theme: AppThemeData.appTheme,
      routes: {
        '/': (context) => const Tabs(),
        ShoeDetailsScreen.detailsScreen: (context) => const ShoeDetailsScreen(),
        CartScreen.cartScreen: (context) => const CartScreen(),
        PaymentSuccessfulScreen.paymentSuccessfulScreen: (context) =>
            const PaymentSuccessfulScreen(),
        OrderHistoryScreen.orderHistory: (context) =>
            const OrderHistoryScreen(),
        WishlistScreen.wishlist: (context) => const WishlistScreen(),
      },
    );
  }
}
