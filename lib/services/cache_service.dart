import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hype_kicks/models/shoe.dart';
import 'package:hype_kicks/models/shoe_cache.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class CacheService extends StateNotifier<AsyncValue<List<Shoe>>> {
  CacheService(this.ref) : super(const AsyncData([])) {
    getShoes();
  }

  final Ref ref;

// to create a todo
  Future<void> addShoe(ShoeCache shoeCache) async {
    try {
      state = const AsyncLoading();
      final isar = await ref.read(_isarProvider.future);
      await isar.writeTxn(() async => await isar.shoeCaches.put(shoeCache));
      final allShoes = await isar.shoeCaches.where().findAll();
      state = AsyncData(_convertShoeCacheToShoe(allShoes));
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

// to get all Todos
  Future<void> getShoes() async {
    try {
      state = const AsyncLoading();
      final isar = await ref.read(_isarProvider.future);
      final allShoes = await isar.shoeCaches.where().findAll();
      state = AsyncData(_convertShoeCacheToShoe(allShoes));
      // state = AsyncError('an error occured', StackTrace.fromString('')); mimicking an error
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

// to delete a Todo
  Future<void> deleteShoe(String id) async {
    try {
      state = const AsyncLoading();
      final isar = await ref.read(_isarProvider.future);
      final foundShoeCache =
          await isar.shoeCaches.filter().idMatches(id).findFirst();
      if (foundShoeCache != null) {
        await isar.writeTxn(
            () async => await isar.shoeCaches.delete(foundShoeCache.cacheId));
      }
      final allTodos = await isar.shoeCaches.where().findAll();
      state = AsyncData(_convertShoeCacheToShoe(allTodos));
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

Future<void> clearCache() async {
  try {
    state = const AsyncLoading();
    final isar = await ref.read(_isarProvider.future);

    // Get all shoe cache IDs
    final allShoeCaches = await isar.shoeCaches.where().findAll();
    final idsToDelete = allShoeCaches.map((shoe) => shoe.cacheId).toList();

    await isar.writeTxn(() async => await isar.shoeCaches.deleteAll(idsToDelete));
    state = const AsyncData([]); // Set state to reflect a cleared cache
  } catch (e, st) {
    state = AsyncError(e, st);
  }
}


  List<Shoe> _convertShoeCacheToShoe(List<ShoeCache> todoIsar) {
    return todoIsar.map(Shoe.fromShoeCache).toList();
  }
}

final cacheServiceProvider =
    StateNotifierProvider<CacheService, AsyncValue<List<Shoe>>>((ref) {
  return CacheService(ref);
});

final _isarProvider = FutureProvider<Isar>((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  // opening an isar instance
  return await Isar.open([ShoeCacheSchema], directory: dir.path);
});
// class CacheService extends StateNotifier<AsyncValue<List<Shoe>>> {
//   CacheService(this.ref) : super(const AsyncData([])) {
//     getShoes();
//   }

//   final Ref ref;


// // to create a todo
//   Future<void> addShoe(ShoeCache shoeCache) async {
//     try {
//       state = const AsyncLoading();
//       final isar = await ref.read(_isarProvider.future);
//       await isar.writeTxn(() async => await isar.shoeCaches.put(shoeCache));
//       final allShoes = await isar.shoeCaches.where().findAll();
//       state = AsyncData(_convertShoeCacheToShoe(allShoes));
//     } catch (e, st) {
//       state = AsyncError(e, st);
//     }
//   }

// // to get all Todos
//   Future<void> getShoes() async {
//     try {
//       state = const AsyncLoading();
//       final isar = await ref.read(_isarProvider.future);
//       final allShoes = await isar.shoeCaches.where().findAll();
//       state = AsyncData(_convertShoeCacheToShoe(allShoes));
//       // state = AsyncError('an error occured', StackTrace.fromString('')); mimicking an error
//     } catch (e, st) {
//       state = AsyncError(e, st);
//     }
//   }

// // to delete a Todo
//   Future<void> deleteShoe(String id) async {
//     try {
//       state = const AsyncLoading();
//       final isar = await ref.read(_isarProvider.future);
//       final foundShoeCache =
//           await isar.shoeCaches.filter().idMatches(id).findFirst();
//       if (foundShoeCache != null) {
//         await isar.writeTxn(
//             () async => await isar.shoeCaches.delete(foundShoeCache.cacheId));
//       }
//       final allTodos = await isar.shoeCaches.where().findAll();
//       state = AsyncData(_convertShoeCacheToShoe(allTodos));
//     } catch (e, st) {
//       state = AsyncError(e, st);
//     }
//   }

//   List<Shoe> _convertShoeCacheToShoe(List<ShoeCache> todoIsar) {
//     return todoIsar.map(Shoe.fromShoeCache).toList();
//   }
// }

// final cacheServiceProvider =
//     StateNotifierProvider<CacheService, AsyncValue<List<Shoe>>>((ref) {
//   return CacheService(ref);
// });

// final _isarProvider = FutureProvider<Isar>((ref) async {
//   final dir = await getApplicationDocumentsDirectory();
//   // opening an isar instance
//   return await Isar.open([ShoeCacheSchema], directory: dir.path);
// });