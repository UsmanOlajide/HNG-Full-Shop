import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:hype_kicks/models/shoe_cache.dart';

class Shoe {
  Shoe({
    required this.name,
    required this.category,
    required this.id,
    required this.photoUrls,
    required this.price,
    this.quantity = 1,
  });

  final String name;
  final List<String> category;
  final String id;
  final List<String> photoUrls;
  final List<double> price;
  double quantity;



  @override
  String toString() {
    return 'Shoe(name: $name, id: $id)';
  }


  factory Shoe.fromMap(Map<String, dynamic> map) {
    return Shoe(
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

   @override
  bool operator ==(covariant Shoe other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      listEquals(other.category, category) &&
      other.id == id &&
      listEquals(other.photoUrls, photoUrls) &&
      listEquals(other.price, price) &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      category.hashCode ^
      id.hashCode ^
      photoUrls.hashCode ^
      price.hashCode ^
      quantity.hashCode;
  }
  factory Shoe.fromShoeCache(ShoeCache shoecache) {
    return Shoe(
      name: shoecache.name,
      category: shoecache.category,
      id: shoecache.id.toString(),
      photoUrls: shoecache.photoUrls,
      price: shoecache.price,
      quantity: shoecache.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'category': category,
      'id': id,
      'photoUrls': photoUrls,
      'price': price,
      'quantity': quantity,

    };
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

  factory Shoe.fromJson(String source) =>
      Shoe.fromMap(json.decode(source) as Map<String, dynamic>);
}

const imageUrl = 'https://api.timbu.cloud/images';
