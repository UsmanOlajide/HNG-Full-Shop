import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hype_kicks/colors.dart';
import 'package:hype_kicks/enums.dart';
import 'package:hype_kicks/models/shoe.dart';
import 'package:hype_kicks/providers/cart_provider.dart';
import 'package:hype_kicks/providers/favorite_provider.dart';
import 'package:hype_kicks/screens/cart_screen.dart';
import 'package:hype_kicks/services/cache_service.dart';
import 'package:hype_kicks/widgets/build_grid.dart';

class ShoeDetailsScreen extends ConsumerStatefulWidget {
  const ShoeDetailsScreen({super.key});

  static const detailsScreen = '/shoe-details-screen';

  @override
  ConsumerState<ShoeDetailsScreen> createState() => _ShoeDetailsScreenState();
}

class _ShoeDetailsScreenState extends ConsumerState<ShoeDetailsScreen> {
  var isFavorite = true;
  int selectedSizeIndex = Random().nextInt(7);
  int selectedColorIndex = Random().nextInt(7);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final shoe = args['shoe'] as Shoe;
    final moreShoes = args['moreShoes'] as List<Shoe>;
    var shoePresent =
        ref.read(cartProviderProvider.notifier).isPresent(shoe.id);
    // print(shoePresent);
    var isLiked =
        ref.read(favoriteProviderProvider.notifier).isFavorite(shoe.id);
    var cartShoes = ref.watch(cartProviderProvider);
    var favoriteShoes = ref.watch(favoriteProviderProvider);
    print(favoriteShoes);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: SvgPicture.asset(
                  'assets/arrow_left.svg',
                  // colorFilter: const ColorFilter.mode(tintColor, BlendMode.srcIn),
                  fit: BoxFit.cover,
                ),
              ),
              // backgroundColor: Colors.green[300],
              // expandedHeight: 350,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                // title: OfferIndicator(isCurrentItem: true),
                background: Container(
                  // color: Colors.red,
                  // width: 40,
                  // height: 240,
                  child: Image.network(
                    shoe.photoUrls.first,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.category.first,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 12.0,
                            color: gray500,
                          ),
                    ),
                    const SizedBox(height: 8.0),
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shoe.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: gray500,
                                      ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  shoe.formattedPrice,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 15.0,
                                        color: gray500,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(favoriteProviderProvider.notifier)
                                  .addFavorite(shoe);
                            },
                            child: Container(
                              width: 30.8,
                              height: 30.8,
                              decoration: BoxDecoration(
                                color: isLiked
                                    ? const Color(0xFFD42620)
                                    : const Color.fromRGBO(0, 0, 0, 0.6),
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              child: SvgPicture.asset(
                                isLiked
                                    ? 'assets/favourite_white.svg'
                                    : 'assets/favourite.svg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Text(
                          '100 sold',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: gray400,
                                  ),
                        ),
                        const SizedBox(width: 8.0),
                        SvgPicture.asset('assets/star-half.svg'),
                        const SizedBox(width: 4.0),
                        Text(
                          '4.5 (32 reviews)',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: gray400,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 15.0,
                                    color: gray500,
                                  ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'The  Ego Vessel is the perfect addition to your casual wardrobe. Pair them with jeans, joggers, or even a dress for an effortlessly cool look that\'s sure to make a statement. Whether you\'re running errands or hitting the town, these versatile sneakers will keep you feeling and looking your best.',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 15.0,
                                    color: gray400,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Size',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 15.0,
                                    color: gray500,
                                  ),
                        ),
                        // Wrap(
                        //   spacing: 12.0,
                        //   // runSpacing: ,
                        //   children: [
                        //     for (int i = 0; i < 7; i++)
                        //       Container(
                        //         width: 40.86,
                        //         height: 26.0,
                        //         decoration: BoxDecoration(
                        //             color: i == 3
                        //                 ? const Color(0xFF0072C6)
                        //                 : secondary50,
                        //             borderRadius: BorderRadius.circular(4.0)),
                        //         child: Center(
                        //           child: Text(
                        //             // Access the corresponding number based on index
                        //             '${ShoeSize.values[i].shoeSize}',
                        //             style: TextStyle(
                        //                 color: i == 3 ? Colors.white : gray400),
                        //           ),
                        //         ),
                        //       ),
                        //     // const SizedBox(width: 12.0),
                        //   ],
                        // ),
                        Wrap(
                          spacing: 12.0,
                          children: [
                            for (int i = 0; i < 7; i++)
                              GestureDetector(
                                onTap: () => setState(() {
                                  selectedSizeIndex = i;
                                }),
                                child: Container(
                                  width: 40.86,
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                    color: i == selectedSizeIndex
                                        ? const Color(0xFF0072C6)
                                        : secondary50,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${ShoeSize.values[i].shoeSize}',
                                      style: TextStyle(
                                          color: i == selectedSizeIndex
                                              ? Colors.white
                                              : gray400),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Colours',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 15.0,
                                    color: gray500,
                                  ),
                        ),
                        const SizedBox(height: 4.0),
                        Wrap(
                          spacing: 12.0,
                          children: [
                            for (int i = 0; i < 7; i++)
                              GestureDetector(
                                onTap: () => setState(() {
                                  selectedColorIndex = i;
                                }),
                                child: Container(
                                  width: 25.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: ShoeColor.values[i].shoeColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: i == selectedColorIndex
                                      ? SvgPicture.asset('assets/tick.svg')
                                      : null,
                                ),
                              ),
                          ],
                        )
                        // Wrap(
                        //   spacing: 12.0,
                        //   // runSpacing: ,
                        //   children: [
                        //     for (int i = 0; i < 7; i++)
                        //       Container(
                        //         width: 25.0,
                        //         height: 24.0,
                        //         decoration: BoxDecoration(
                        //             color: ShoeColor.values[i].shoeColor,
                        //             borderRadius: BorderRadius.circular(4.0)),
                        //         child: i == 3
                        //             ? SvgPicture.asset('assets/tick.svg')
                        //             : null,
                        //       ),

                        //     // const SizedBox(width: 12.0),
                        //   ],
                        // ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 15.0,
                                    color: gray500,
                                  ),
                        ),
                        const SizedBox(height: 4.0),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          width: 121.0,
                          height: 34.0,
                          decoration: BoxDecoration(
                            color: secondary50,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 16.0,
                                  ),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    if (shoe.quantity < 0) return;
                                    if (shoe.quantity == 1) return;
                                    setState(() => shoe.quantity--);
                                  }),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 4.0,
                                ),
                                width: 25.0,
                                height: 26.0,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(0, 114, 198, 0.12),
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                child: Text(
                                  '${shoe.quantity}',
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  size: 16.0,
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () =>
                                    setState(() => shoe.quantity++),
                              ),
                            ],
                          ),
                        ),
                        // child: ,
                      ],
                    ),
                    const SizedBox(height: 52.2),
                    Text(
                      'More Shoes',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 24.0,
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(height: 20.0),
                    BuildGrid(shoes: moreShoes)
                  ],
                ),
                // Container(
                //   height: 200,
                //   width: double.infinity,
                //   color: Colors.red,
                // ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 21.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: 80.0,
          child: SizedBox(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total price',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 12.0,
                            color: gray200,
                            height: 0,
                          ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      shoe.formattedPrice,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 19.0,
                            color: gray500,
                            height: 0,
                          ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.cartScreen,
                          arguments: moreShoes);
                    },
                    icon: const Icon(Icons.arrow_right)),
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(cartProviderProvider.notifier).addShoe(shoe);
                    Navigator.of(context)
                        .pushNamed(CartScreen.cartScreen, arguments: moreShoes);
                    print(cartShoes);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF0072C6),
                  ),
                  label: Text(shoePresent ? 'Added' : 'Add to Cart'),
                  icon: shoePresent
                      ? const Icon(Icons.done)
                      : SvgPicture.asset('assets/basket_white.svg'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
