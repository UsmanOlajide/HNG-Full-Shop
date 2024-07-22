import 'package:hype_kicks/models/shoe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'cart_provider.g.dart';

@riverpod
class CartProvider extends _$CartProvider {
  @override
  List<Shoe> build() {
    return [];
  }

  bool isPresent(String id) => state.indexWhere((item) => item.id == id) > -1;

  void addShoe(Shoe shoe) {
    final existingIndex = state.indexWhere((item) => item.id == shoe.id);
    if (existingIndex >= 0) {
      removeShoe(shoe.id);
    } else {
      state = [...state, shoe];
    }
  }

  void removeShoe(String shoeId) {
    state = state.where((item) => item.id != shoeId).toList();
  }

  double get delivery => 1550.0;
  double get discount => 4000.0;

  double get _subtotalPrice {
    final subtotal = state.fold(
        0.0, (sum, product) => sum + product.price.first * product.quantity);
    return subtotal;
  }

  String get subtotalPrice {
    return _subtotalPrice.toStringAsFixed(2);
  }

  String totalPrice() {
    return (_subtotalPrice + delivery - discount).toStringAsFixed(2);
  }
}