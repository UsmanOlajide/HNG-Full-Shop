// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hype_kicks/colors.dart';
// import 'package:hype_kicks/data/home_repository.dart';
// import 'package:hype_kicks/enums.dart';
// import 'package:hype_kicks/models/shoe.dart';
// import 'package:hype_kicks/models/shoe_cache.dart';
// import 'package:hype_kicks/offer_indicator.dart';
// import 'package:hype_kicks/providers/cart_provider.dart';
// import 'package:hype_kicks/providers/favorite_provider.dart';
// import 'package:hype_kicks/screens/order_history_screen.dart';
// import 'package:hype_kicks/screens/shoe_details_screen.dart';
// import 'package:hype_kicks/screens/wishlist_screen.dart';
// import 'package:hype_kicks/services/cache_service.dart';
// import 'package:hype_kicks/widgets/build_grid.dart';

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   late Future<List<Shoe>> getShoes;
//   var _currentIndex = 0;

//   // void navigate(Shoe shoe, List<Shoe> moreShoes) {
//   //   Navigator.pushNamed(
//   //     context,
//   //     ShoeDetailsScreen.detailsScreen,
//   //     arguments: {
//   //       'shoe': shoe,
//   //       'moreShoes': moreShoes,
//   //     },
//   //   );
//   // }
//   @override
//   void initState() {
//     super.initState();
//     getShoes = homeRepo.fetchShoes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print(Brand.values.toList());
//     var favoriteShoes = ref.watch(favoriteProviderProvider);
//     print(favoriteShoes);
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Align(
//           alignment: Alignment.bottomCenter,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SvgPicture.asset('assets/ag.svg'),
//                 // const SizedBox(width: 100),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 10.0),
//                       child: SizedBox(
//                         width: 30.0,
//                         height: 30.0,
//                         // color: Colors.red,
//                         child: IconButton(
//                           alignment: Alignment.center,
//                           onPressed: () => Navigator.of(context)
//                               .pushNamed(OrderHistoryScreen.orderHistory),
//                           icon: const Icon(
//                             Icons.history_rounded,
//                             size: 25.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 20.0),
//                     SvgPicture.asset('assets/search.svg'),
//                     const SizedBox(width: 10.0),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 10.0),
//                       child: SizedBox(
//                         width: 30.0,
//                         height: 30.0,
//                         // color: Colors.red,
//                         child: IconButton(
//                           alignment: Alignment.center,
//                           onPressed: () => Navigator.of(context)
//                               .pushNamed(WishlistScreen.wishlist),
//                           icon: const Icon(
//                             Icons.favorite_border_rounded,
//                             size: 25.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: FutureBuilder(
//         future: getShoes,
//         builder: (context, snapshot) {
//           // print(snapshot);
//           if (snapshot.hasData) {
//             final shoes = snapshot.data!;
//             final viewList = [shoes[8], shoes[3], shoes[0], shoes[10]];
//             final specialOffers = [shoes[6], shoes[12], shoes[5], shoes[11]];
//             // final moreShoes = [shoes[3], shoes[10], shoes[0], shoes[8]];
//             // // final moreShoes = [shoes[10]];
//             final featuredSneakers = [
//               shoes[8],
//               shoes[1],
//               shoes[2],
//               shoes[7],
//               shoes[4],
//               shoes[9]
//             ];
//             return SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const TopSection(),
//                       const SizedBox(height: 32.0),
//                       TopPicks(
//                         viewList: viewList,
//                         onPageChanged: (itemIndex) {
//                           setState(() {
//                             _currentIndex = itemIndex;
//                           });
//                         },
//                         currentIndex: _currentIndex,
//                       ),
//                       const SizedBox(height: 16.0),
//                       const BrandSection(),
//                       const SizedBox(height: 48.0),
//                       Text(
//                         'Our Special Offers',
//                         style: GoogleFonts.robotoFlex(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 24.0,
//                           color: black,
//                         ),
//                       ),
//                       BuildGrid(shoes: specialOffers),
//                       //*---------------------------
//                       // GridView.builder(
//                       //   physics: const NeverScrollableScrollPhysics(),
//                       //   shrinkWrap: true,
//                       //   itemCount: specialOffers.length,
//                       //   gridDelegate:
//                       //       const SliverGridDelegateWithFixedCrossAxisCount(
//                       //     childAspectRatio: 0.5,
//                       //     crossAxisCount: 2,
//                       //     crossAxisSpacing: 21.0,
//                       //   ),
//                       //   itemBuilder: (context, index) {
//                       //     var isLiked = ref
//                       //         .read(favoriteProviderProvider.notifier)
//                       //         .isFavorite(shoes[index].id);
//                       //     return LayoutBuilder(
//                       //       builder: (context, constraints) {
//                       //         final maxHeight = constraints.maxHeight;
//                       //         // print(constraints);
//                       //         return Column(
//                       //           children: [
//                       //             Stack(
//                       //               children: [
//                       //                 GestureDetector(
//                       //                   onTap: () => Navigator.of(context)
//                       //                       .pushNamed(
//                       //                           ShoeDetailsScreen.detailsScreen,
//                       //                           arguments: {
//                       //                         'shoe': specialOffers[index],
//                       //                         'moreShoes': specialOffers,
//                       //                       }),
//                       //                   child: Container(
//                       //                     height: maxHeight * 0.6,
//                       //                     margin: const EdgeInsets.only(
//                       //                         bottom: 10.0),
//                       //                     padding: const EdgeInsets.all(10.0),
//                       //                     decoration: BoxDecoration(
//                       //                       color: gray50,
//                       //                       borderRadius:
//                       //                           BorderRadius.circular(8.0),
//                       //                       image: DecorationImage(
//                       //                         image: NetworkImage(
//                       //                             specialOffers[index]
//                       //                                 .photoUrls
//                       //                                 .first),
//                       //                       ),
//                       //                     ),
//                       //                   ),
//                       //                 ),
//                       //                 Positioned(
//                       //                   top: 8.0,
//                       //                   right: 8.2,
//                       //                   child: GestureDetector(
//                       //                     // onTap: onTap,
//                       //                     // onTap: () => setState(() => isLiked = !isLiked),
//                       //                     onTap: () {
//                       //                       ref
//                       //                           .read(favoriteProviderProvider
//                       //                               .notifier)
//                       //                           .addFavorite(
//                       //                               specialOffers[index]);
//                       //                     },
//                       //                     child: Container(
//                       //                       width: 30.8,
//                       //                       height: 30.8,
//                       //                       decoration: BoxDecoration(
//                       //                         color: isLiked
//                       //                             ? const Color(0xFFD42620)
//                       //                             : const Color.fromRGBO(
//                       //                                 0, 0, 0, 0.6),
//                       //                         borderRadius:
//                       //                             BorderRadius.circular(32.0),
//                       //                       ),
//                       //                       child: SvgPicture.asset(
//                       //                         isLiked
//                       //                             ? 'assets/favourite_white.svg'
//                       //                             : 'assets/favourite.svg',
//                       //                         fit: BoxFit.scaleDown,
//                       //                       ),
//                       //                     ),
//                       //                   ),
//                       //                 ),
//                       //               ],
//                       //             ),
//                       //             // Container(
//                       //             //   height: 92,
//                       //             //   color: Colors.red[400],
//                       //             // ),
//                       //             SizedBox(
//                       //               height: maxHeight * 0.36,
//                       //               // color: Colors.amber,
//                       //               child: Column(
//                       //                 crossAxisAlignment:
//                       //                     CrossAxisAlignment.start,
//                       //                 children: [
//                       //                   Text(
//                       //                     specialOffers[index].category.first,
//                       //                     style: Theme.of(context)
//                       //                         .textTheme
//                       //                         .titleSmall!
//                       //                         .copyWith(
//                       //                           fontSize: 10.0,
//                       //                           color: gray500,
//                       //                         ),
//                       //                   ),
//                       //                   Text(
//                       //                     specialOffers[index].name,
//                       //                     style: Theme.of(context)
//                       //                         .textTheme
//                       //                         .labelMedium!
//                       //                         .copyWith(
//                       //                           color: gray500,
//                       //                         ),
//                       //                   ),
//                       //                   const SizedBox(height: 8.0),
//                       //                   Row(
//                       //                     children: [
//                       //                       SvgPicture.asset(
//                       //                           'assets/star-half.svg'),
//                       //                       const SizedBox(width: 4.0),
//                       //                       Text(
//                       //                         '4.5 (100 sold)',
//                       //                         style: Theme.of(context)
//                       //                             .textTheme
//                       //                             .labelLarge!
//                       //                             .copyWith(
//                       //                               fontSize: 10.0,
//                       //                               color: gray500,
//                       //                             ),
//                       //                       ),
//                       //                     ],
//                       //                   ),
//                       //                   const SizedBox(height: 8.0),
//                       //                   Row(
//                       //                     children: [
//                       //                       Column(
//                       //                         mainAxisSize: MainAxisSize.min,
//                       //                         crossAxisAlignment:
//                       //                             CrossAxisAlignment.start,
//                       //                         children: [
//                       //                           Text(
//                       //                             specialOffers[index]
//                       //                                 .discountPrice,
//                       //                             style: Theme.of(context)
//                       //                                 .textTheme
//                       //                                 .labelMedium!
//                       //                                 .copyWith(
//                       //                                   color: const Color(
//                       //                                       0xFF0072C6),
//                       //                                 ),
//                       //                           ),
//                       //                           Text(
//                       //                             specialOffers[index]
//                       //                                 .formattedPrice,
//                       //                             style: Theme.of(context)
//                       //                                 .textTheme
//                       //                                 .bodySmall!
//                       //                                 .copyWith(
//                       //                                     color: gray200,
//                       //                                     decoration:
//                       //                                         TextDecoration
//                       //                                             .lineThrough),
//                       //                           ),
//                       //                         ],
//                       //                       ),
//                       //                       Container(
//                       //                         // padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//                       //                         width: 36.0,
//                       //                         height: 28.0,
//                       //                         decoration: BoxDecoration(
//                       //                           borderRadius:
//                       //                               BorderRadius.circular(8.0),
//                       //                         ),
//                       //                       )
//                       //                     ],
//                       //                   )
//                       //                 ],
//                       //               ),
//                       //             ),
//                       //           ],
//                       //         );
//                       //       },
//                       //     );
//                       //   },
//                       // ),
//                       //*---------------------------
//                       Text(
//                         'Featured Sneakers',
//                         style: Theme.of(context).textTheme.labelLarge!.copyWith(
//                               fontSize: 24.0,
//                               color: Colors.black,
//                             ),
//                       ),
//                       const SizedBox(height: 20.0),
//                       BuildGrid(shoes: featuredSneakers),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//           if (snapshot.hasError) {
//             return const Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.cancel_outlined,
//                     size: 100.0,
//                     color: Colors.red,
//                   ),
//                   Text('Failed to load hyper kicks'),
//                 ],
//               ),
//             );
//           }
//           return const Center(
//             child: Text('loading...'),
//             // child: CircularProgressIndicator.adaptive(),
//           );
//         },
//       ),
//     );
//   }
// }

// class TopSection extends StatelessWidget {
//   const TopSection({
//     super.key,
//     this.onPressed,
//   });

//   final void Function()? onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Image.asset('assets/dp.png'),
//         const SizedBox(width: 4.0),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ElevatedButton(onPressed: onPressed, child: const Text('press')),
//             Text(
//               'Good afternoon 👋🏽',
//               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 15.0,
//                     color: gray300,
//                   ),
//             ),
//             Text(
//               'Ada Dennis',
//               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 19.0,
//                     color: gray500,
//                   ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class TopPicks extends ConsumerWidget {
//   TopPicks({
//     super.key,
//     required this.viewList,
//     this.onPageChanged,
//     required this.currentIndex,
//   });

//   final List<Shoe> viewList;
//   final void Function(int)? onPageChanged;
//   final int currentIndex;

//   final gradientColors = [
//     [
//       const Color.fromRGBO(0, 114, 198, 0.8),
//       const Color.fromRGBO(0, 55, 96, 0.9)
//     ],
//     [Colors.black26, const Color(0xFF333333)],
//     [const Color(0xFF1D2939), const Color.fromARGB(192, 129, 49, 0)],
//     [const Color.fromARGB(37, 41, 71, 146), const Color(0xFF1D2939)]
//   ];

//   void navigate(BuildContext context, Shoe shoe, List<Shoe> moreShoes) {
//     Navigator.pushNamed(
//       context,
//       ShoeDetailsScreen.detailsScreen,
//       arguments: {
//         'shoe': shoe,
//         'moreShoes': moreShoes,
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var cartShoes = ref.watch(cartProviderProvider);

//     return SizedBox(
//       height: 200.0,
//       child: PageView.builder(
//         itemCount: viewList.length,
//         // onPageChanged:
//         // (itemIndex) {
//         //   setState(() {
//         //     _currentIndex = itemIndex;
//         //   });
//         // },
//         onPageChanged: onPageChanged,
//         itemBuilder: (context, index) {
//           final shoe = viewList[index];
//           var isPresent =
//               ref.read(cartProviderProvider.notifier).isPresent(shoe.id);

//           return GestureDetector(
//             onTap: () => navigate(context, shoe, viewList),
//             child: Stack(
//               children: [
//                 Container(
//                   // color: Colors.red,
//                   width: double.infinity,
//                   padding: const EdgeInsets.only(
//                     left: 32.0,
//                     top: 23.0,
//                     right: 18.0,
//                     bottom: 16.0,
//                   ),
//                   decoration: BoxDecoration(
//                     // color: dummy,
//                     gradient: LinearGradient(
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                       colors: gradientColors[index],
//                     ),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Image.network(
//                     shoe.photoUrls.first,
//                     alignment: Alignment.centerLeft,
//                     fit: BoxFit.contain,
//                   ),
//                   // Image.network(shoes[0].photoUrls.first),
//                 ),
//                 Positioned(
//                   top: 66.0,
//                   right: 20.0,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         shoe.category.first,
//                         style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                               fontSize: 8.0,
//                               color: gray50,
//                             ),
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             shoe.name,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .labelMedium!
//                                 .copyWith(
//                                   fontSize: 12.0,
//                                   fontWeight: FontWeight.w600,
//                                   color: gray50,
//                                 ),
//                           ),
//                           const SizedBox(width: 4.0),
//                           Text(
//                             shoe.formattedPrice,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .labelMedium!
//                                 .copyWith(
//                                     fontSize: 12.0,
//                                     fontWeight: FontWeight.w600,
//                                     color: gray50),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   right: 18.0,
//                   bottom: 65.0,
//                   child: SizedBox(
//                     height: 30.0,
//                     child: ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: darkBlue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       onPressed: () {
//                         ref.read(cacheServiceProvider.notifier).addShoe(
//                               ShoeCache(
//                                 name: shoe.name,
//                                 category: shoe.category,
//                                 id: shoe.id,
//                                 photoUrls: shoe.photoUrls,
//                                 price: shoe.price,
//                                 quantity: shoe.quantity,
//                               ),
//                             );
//                       },
//                       label: Text(
//                         'Add to cart',
//                         style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                               fontSize: 12.0,
//                               color: const Color(0xFF0072C6),
//                             ),
//                       ),
//                       icon: SvgPicture.asset('assets/basket.svg'),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 8.0,
//                   left: 0.0,
//                   right: 0.0,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       for (var i = 0; i < viewList.length; i++) ...[
//                         OfferIndicator(
//                           isCurrentItem: i == currentIndex,
//                         ),
//                         const SizedBox(width: 8.0),
//                       ],
//                     ],
//                   ),
//                 ),
//                 // Image.
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class BrandSection extends StatelessWidget {
//   const BrandSection({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       alignment: WrapAlignment.spaceBetween,
//       spacing: 50.0,
//       runSpacing: 46.0,
//       children: [
//         // ...Brand.allValues,
//         ...Brand.values.map(
//           (brand) {
//             return Column(
//               children: [
//                 Container(
//                   width: 48,
//                   height: 48,
//                   decoration: const BoxDecoration(
//                     // color: Colors.grey,
//                     color: secondary50,
//                     shape: BoxShape.circle,
//                   ),
//                   child: SvgPicture.asset(
//                     brand.imagePath,
//                     fit: BoxFit.scaleDown,
//                   ),
//                 ),
//                 const SizedBox(height: 4.0),
//                 Text(
//                   brand.name,
//                   style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                         fontSize: 10.0,
//                         fontWeight: FontWeight.w500,
//                         color: gray500,
//                       ),
//                 )
//               ],
//             );
//           },
//         ),
//         Container(
//           width: 45,
//           height: 45,
//           decoration: const BoxDecoration(
//             // color: Colors.grey,

//             color: secondary50,
//             shape: BoxShape.circle,
//           ),
//           child: Center(
//             child: Text(
//               'View all',
//               style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                     fontSize: 8.0,
//                     fontWeight: FontWeight.w500,
//                     color: gray500,
//                   ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hype_kicks/colors.dart';
import 'package:hype_kicks/data/home_repository.dart';
import 'package:hype_kicks/enums.dart';
import 'package:hype_kicks/models/shoe.dart';
import 'package:hype_kicks/models/shoe_cache.dart';
import 'package:hype_kicks/offer_indicator.dart';
import 'package:hype_kicks/providers/cart_provider.dart';
import 'package:hype_kicks/providers/favorite_provider.dart';
import 'package:hype_kicks/screens/order_history_screen.dart';
import 'package:hype_kicks/screens/shoe_details_screen.dart';
import 'package:hype_kicks/screens/wishlist_screen.dart';
import 'package:hype_kicks/services/cache_service.dart';
import 'package:hype_kicks/widgets/build_grid.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<List<Shoe>> getShoes;
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getShoes = homeRepo.fetchShoes();
  }

  @override
  Widget build(BuildContext context) {
    // print(Brand.values.toList());
    var favoriteShoes = ref.watch(favoriteProviderProvider);
    print(favoriteShoes);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/ag.svg'),
                // const SizedBox(width: 100),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        // color: Colors.red,
                        child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () => Navigator.of(context)
                              .pushNamed(OrderHistoryScreen.orderHistory),
                          icon: const Icon(
                            Icons.history_rounded,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    SvgPicture.asset('assets/search.svg'),
                    const SizedBox(width: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        // color: Colors.red,
                        child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () => Navigator.of(context)
                              .pushNamed(WishlistScreen.wishlist),
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: getShoes,
        builder: (context, snapshot) {
          // print(snapshot);
          if (snapshot.hasData) {
            final shoes = snapshot.data!;
            final viewList = [shoes[8], shoes[3], shoes[0], shoes[10]];
            final specialOffers = [shoes[6], shoes[12], shoes[5], shoes[11]];
            // final moreShoes = [shoes[3], shoes[10], shoes[0], shoes[8]];
            // // final moreShoes = [shoes[10]];
            final featuredSneakers = [
              shoes[8],
              shoes[1],
              shoes[2],
              shoes[7],
              shoes[4],
              shoes[9]
            ];
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopSection(),
                      const SizedBox(height: 32.0),
                      TopPicks(
                        viewList: viewList,
                        onPageChanged: (itemIndex) {
                          setState(() {
                            _currentIndex = itemIndex;
                          });
                        },
                        currentIndex: _currentIndex,
                      ),
                      const SizedBox(height: 16.0),
                      const BrandSection(),
                      const SizedBox(height: 48.0),
                      Text(
                        'Our Special Offers',
                        style: GoogleFonts.robotoFlex(
                          fontWeight: FontWeight.w500,
                          fontSize: 24.0,
                          color: black,
                        ),
                      ),
                      BuildGrid(shoes: specialOffers),
                      //*---------------------------
                      // GridView.builder(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemCount: specialOffers.length,
                      //   gridDelegate:
                      //       const SliverGridDelegateWithFixedCrossAxisCount(
                      //     childAspectRatio: 0.5,
                      //     crossAxisCount: 2,
                      //     crossAxisSpacing: 21.0,
                      //   ),
                      //   itemBuilder: (context, index) {
                      //     var isLiked = ref
                      //         .read(favoriteProviderProvider.notifier)
                      //         .isFavorite(shoes[index].id);
                      //     return LayoutBuilder(
                      //       builder: (context, constraints) {
                      //         final maxHeight = constraints.maxHeight;
                      //         // print(constraints);
                      //         return Column(
                      //           children: [
                      //             Stack(
                      //               children: [
                      //                 GestureDetector(
                      //                   onTap: () => Navigator.of(context)
                      //                       .pushNamed(
                      //                           ShoeDetailsScreen.detailsScreen,
                      //                           arguments: {
                      //                         'shoe': specialOffers[index],
                      //                         'moreShoes': specialOffers,
                      //                       }),
                      //                   child: Container(
                      //                     height: maxHeight * 0.6,
                      //                     margin: const EdgeInsets.only(
                      //                         bottom: 10.0),
                      //                     padding: const EdgeInsets.all(10.0),
                      //                     decoration: BoxDecoration(
                      //                       color: gray50,
                      //                       borderRadius:
                      //                           BorderRadius.circular(8.0),
                      //                       image: DecorationImage(
                      //                         image: NetworkImage(
                      //                             specialOffers[index]
                      //                                 .photoUrls
                      //                                 .first),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Positioned(
                      //                   top: 8.0,
                      //                   right: 8.2,
                      //                   child: GestureDetector(
                      //                     // onTap: onTap,
                      //                     // onTap: () => setState(() => isLiked = !isLiked),
                      //                     onTap: () {
                      //                       ref
                      //                           .read(favoriteProviderProvider
                      //                               .notifier)
                      //                           .addFavorite(
                      //                               specialOffers[index]);
                      //                     },
                      //                     child: Container(
                      //                       width: 30.8,
                      //                       height: 30.8,
                      //                       decoration: BoxDecoration(
                      //                         color: isLiked
                      //                             ? const Color(0xFFD42620)
                      //                             : const Color.fromRGBO(
                      //                                 0, 0, 0, 0.6),
                      //                         borderRadius:
                      //                             BorderRadius.circular(32.0),
                      //                       ),
                      //                       child: SvgPicture.asset(
                      //                         isLiked
                      //                             ? 'assets/favourite_white.svg'
                      //                             : 'assets/favourite.svg',
                      //                         fit: BoxFit.scaleDown,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //             // Container(
                      //             //   height: 92,
                      //             //   color: Colors.red[400],
                      //             // ),
                      //             SizedBox(
                      //               height: maxHeight * 0.36,
                      //               // color: Colors.amber,
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Text(
                      //                     specialOffers[index].category.first,
                      //                     style: Theme.of(context)
                      //                         .textTheme
                      //                         .titleSmall!
                      //                         .copyWith(
                      //                           fontSize: 10.0,
                      //                           color: gray500,
                      //                         ),
                      //                   ),
                      //                   Text(
                      //                     specialOffers[index].name,
                      //                     style: Theme.of(context)
                      //                         .textTheme
                      //                         .labelMedium!
                      //                         .copyWith(
                      //                           color: gray500,
                      //                         ),
                      //                   ),
                      //                   const SizedBox(height: 8.0),
                      //                   Row(
                      //                     children: [
                      //                       SvgPicture.asset(
                      //                           'assets/star-half.svg'),
                      //                       const SizedBox(width: 4.0),
                      //                       Text(
                      //                         '4.5 (100 sold)',
                      //                         style: Theme.of(context)
                      //                             .textTheme
                      //                             .labelLarge!
                      //                             .copyWith(
                      //                               fontSize: 10.0,
                      //                               color: gray500,
                      //                             ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                   const SizedBox(height: 8.0),
                      //                   Row(
                      //                     children: [
                      //                       Column(
                      //                         mainAxisSize: MainAxisSize.min,
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment.start,
                      //                         children: [
                      //                           Text(
                      //                             specialOffers[index]
                      //                                 .discountPrice,
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .labelMedium!
                      //                                 .copyWith(
                      //                                   color: const Color(
                      //                                       0xFF0072C6),
                      //                                 ),
                      //                           ),
                      //                           Text(
                      //                             specialOffers[index]
                      //                                 .formattedPrice,
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .bodySmall!
                      //                                 .copyWith(
                      //                                     color: gray200,
                      //                                     decoration:
                      //                                         TextDecoration
                      //                                             .lineThrough),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       Container(
                      //                         // padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      //                         width: 36.0,
                      //                         height: 28.0,
                      //                         decoration: BoxDecoration(
                      //                           borderRadius:
                      //                               BorderRadius.circular(8.0),
                      //                         ),
                      //                       )
                      //                     ],
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         );
                      //       },
                      //     );
                      //   },
                      // ),
                      //*---------------------------
                      Text(
                        'Featured Sneakers',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 24.0,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(height: 20.0),
                      BuildGrid(shoes: featuredSneakers),
                    ],
                  ),
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cancel_outlined,
                    size: 100.0,
                    color: Colors.red,
                  ),
                  Text('Failed to load hyper kicks'),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/dp.png'),
        const SizedBox(width: 4.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ElevatedButton(onPressed: onPressed, child: const Text('press')),
            Text(
              'Good afternoon 👋🏽',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: gray300,
                  ),
            ),
            Text(
              'Ada Dennis',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 19.0,
                    color: gray500,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

class TopPicks extends ConsumerWidget {
  TopPicks({
    super.key,
    required this.viewList,
    this.onPageChanged,
    required this.currentIndex,
  });

  final List<Shoe> viewList;
  final void Function(int)? onPageChanged;
  final int currentIndex;

  final gradientColors = [
    [
      const Color.fromRGBO(0, 114, 198, 0.8),
      const Color.fromRGBO(0, 55, 96, 0.9)
    ],
    [Colors.black26, const Color(0xFF333333)],
    [const Color(0xFF1D2939), const Color.fromARGB(192, 129, 49, 0)],
    [const Color.fromARGB(37, 41, 71, 146), const Color(0xFF1D2939)]
  ];

  void navigate(BuildContext context, Shoe shoe, List<Shoe> moreShoes) {
    Navigator.pushNamed(
      context,
      ShoeDetailsScreen.detailsScreen,
      arguments: {
        'shoe': shoe,
        'moreShoes': moreShoes,
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartShoes = ref.watch(cartProviderProvider);

    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        itemCount: viewList.length,
        // onPageChanged:
        // (itemIndex) {
        //   setState(() {
        //     _currentIndex = itemIndex;
        //   });
        // },
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          final shoe = viewList[index];
          var isPresent =
              ref.read(cartProviderProvider.notifier).isPresent(shoe.id);

          return GestureDetector(
            onTap: () => navigate(context, shoe, viewList),
            child: Stack(
              children: [
                Container(
                  // color: Colors.red,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 32.0,
                    top: 23.0,
                    right: 18.0,
                    bottom: 16.0,
                  ),
                  decoration: BoxDecoration(
                    // color: dummy,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: gradientColors[index],
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.network(
                    shoe.photoUrls.first,
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.contain,
                  ),
                  // Image.network(shoes[0].photoUrls.first),
                ),
                Positioned(
                  top: 66.0,
                  right: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.category.first,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 8.0,
                              color: gray50,
                            ),
                      ),
                      Row(
                        children: [
                          Text(
                            shoe.name,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: gray50,
                                ),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            shoe.formattedPrice,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: gray50),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 18.0,
                  bottom: 65.0,
                  child: SizedBox(
                    height: 30.0,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        ref.read(cartProviderProvider.notifier).addShoe(shoe);
                        // ref.read(cacheServiceProvider.notifier).addShoe(
                        //       ShoeCache(
                        //         name: shoe.name,
                        //         category: shoe.category,
                        //         id: shoe.id,
                        //         photoUrls: shoe.photoUrls,
                        //         price: shoe.price,
                        //         quantity: shoe.quantity,
                        //       ),
                        //     );
                        // print(cartShoes);
                      },
                      label: Text(
                        isPresent ? 'Added' : 'Add to cart',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12.0,
                              color: const Color(0xFF0072C6),
                            ),
                      ),
                      icon: isPresent
                          ? const Icon(Icons.done)
                          : SvgPicture.asset('assets/basket.svg'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  left: 0.0,
                  right: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < viewList.length; i++) ...[
                        OfferIndicator(
                          isCurrentItem: i == currentIndex,
                        ),
                        const SizedBox(width: 8.0),
                      ],
                    ],
                  ),
                ),
                // Image.
              ],
            ),
          );
        },
      ),
    );
  }
}

class BrandSection extends StatelessWidget {
  const BrandSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 50.0,
      runSpacing: 46.0,
      children: [
        // ...Brand.allValues,
        ...Brand.values.map(
          (brand) {
            return Column(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    // color: Colors.grey,
                    color: secondary50,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    brand.imagePath,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  brand.name,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                        color: gray500,
                      ),
                )
              ],
            );
          },
        ),
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            // color: Colors.grey,

            color: secondary50,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              'View all',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 8.0,
                    fontWeight: FontWeight.w500,
                    color: gray500,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
