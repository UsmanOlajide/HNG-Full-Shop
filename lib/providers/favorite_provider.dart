import 'package:hype_kicks/models/shoe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'favorite_provider.g.dart';

@riverpod
class FavoriteProvider extends _$FavoriteProvider {
  @override
  List<Shoe> build() {
    return [];
  }

  bool isFavorite(String id) => state.indexWhere((item) => item.id == id) > -1;

  // void addFavorite(Shoe shoe) {
  //   if (!isFavorite(shoe.id)) {
  //     state = [...state, shoe]; // Add only if not already present
  //   }
  // }
  
  void addFavorite(Shoe shoe) {
  final existingIndex = state.indexWhere((item) => item.id == shoe.id);
  if (existingIndex >= 0) {
    state = [...state.sublist(0, existingIndex), ...state.sublist(existingIndex + 1)];
  } else {
    state = [...state, shoe];
  }
}



  // void removeFavorite(Shoe shoe) {
  //   state.removeWhere((item) {
  //     return shoe.id == item.id;
  //   });
  // }
}