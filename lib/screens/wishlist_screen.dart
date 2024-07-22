import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hype_kicks/utils/colors.dart';
import 'package:hype_kicks/providers/favorite_provider.dart';
import 'package:hype_kicks/widgets/build_grid.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  static const wishlist = 'wishlist';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var wishList = ref.watch(favoriteProviderProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            'assets/arrow_left.svg',
            fit: BoxFit.cover,
          ),
        ),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 38.0, bottom: 16.0, right: 16.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 8.0),
                    Text(
                      'My Wishlist',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: const Color.fromRGBO(41, 41, 41, 1),
                          fontSize: 19.0),
                    ),
                  ],
                ),
                SvgPicture.asset('assets/search.svg'),
              ],
            ),
          ),
        ),
      ),
      body: wishList.isNotEmpty
          ? Padding(
              padding:
                  const EdgeInsets.only(top: 11.98, left: 16.0, right: 16.0),
              child: BuildGrid(shoes: wishList),
            )
          : Padding(
              padding:
                  const EdgeInsets.only(top: 27.98, left: 16.0, right: 16.0),
              child: Column(
                children: [
                  SvgPicture.asset('assets/empty_wishlist.svg'),
                  const SizedBox(height: 20.0),
                  Text(
                    'You have not added any item to your wish list',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: gray500, fontSize: 15.0),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    height: 42.0,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Discover products',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.white, fontSize: 15.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
