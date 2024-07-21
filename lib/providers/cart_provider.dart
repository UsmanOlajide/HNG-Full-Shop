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
  // void decreaseQuantity(Shoe shoe) {
  //   // this is checking
  //   // if the product already exists, if it does decrease the quantity
  //   // if it doesn't exist delete it ?? makes no sense
  //   final existingIndex = state.indexWhere((item) => item.id == shoe.id);
  //   //checking if the item is already in list
  //   if (existingIndex >= 0) {
  //     if (state[existingIndex].quantity > 0) {
  //       state[existingIndex].quantity--;
  //     }
  //   }
  // }

  // void deleteProduct(Shoe shoe) {
  //   state.removeWhere((item) {
  //     return shoe.id == item.id;
  //   });
  // }

  // // The - should reduce the quantity of a product
  // // Delete should just delete
