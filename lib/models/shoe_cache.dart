import 'dart:convert';

import 'package:hype_kicks/models/shoe.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

part 'shoe_cache.g.dart';

@collection
class ShoeCache {
  ShoeCache({
    this.name = '',
    this.category = const [],
    this.id = '',
    this.photoUrls = const [],
    this.price = const [],
    this.quantity = 1,
  }) : cacheId = Isar.autoIncrement;

  late Id cacheId;
  late String name;
  late List<String> category;
  late String id;
  late List<String> photoUrls;
  late List<double> price;
  late double quantity;


  @override
  String toString() {
    return 'Shoe(name: $name, id: $id)';
  }

  factory ShoeCache.fromMap(Map<String, dynamic> map) {
    return ShoeCache(
      name: map['name'] as String,
      category: (map['categories'] as List)
          .cast<Map<String, dynamic>>()
          .map((category) {
        return category['name'] as String;
      }).toList(),
      id: map['id'] as String,
      photoUrls: (map['photos'] as List).map((photo) {
        return '$imageUrl/${photo['url']}';
      }).toList(),
      price: ((map['current_price'] as List)
          .cast<Map<String, dynamic>>()
          .map((singlePrice) {
        return ((singlePrice['NGN'] ?? []) as List).firstOrNull as double;
      }).toList()),
      quantity: map['available_quantity'] as double,

    );
  }
  factory ShoeCache.fromShoe(Shoe shoe) {
    return ShoeCache(
      name: shoe.name,
      category: shoe.category,
      id: shoe.id,
      photoUrls: shoe.photoUrls,
      price: shoe.price,
      quantity: shoe.quantity,
    );
  }

  String get formattedPrice {
    var newFormattedPrice = '';
    final currencyFormat = NumberFormat.currency(
      locale: 'en_NG',
      symbol: '₦ ',
      decimalDigits: 2,
    );
    newFormattedPrice = currencyFormat.format(price.first);
    return newFormattedPrice;
  }

  String get discountPrice {
    var newDiscountPrice = '';
    final currencyFormat = NumberFormat.currency(
      locale: 'en_NG',
      symbol: '₦ ',
      decimalDigits: 2,
    );
    final priceValue = price.first;
    final discount = priceValue - 4000;

    newDiscountPrice = currencyFormat.format(discount);

    return newDiscountPrice;
  }

  factory ShoeCache.fromJson(String source) =>
      ShoeCache.fromMap(json.decode(source) as Map<String, dynamic>);
}

const imageUrl = 'https://api.timbu.cloud/images';
