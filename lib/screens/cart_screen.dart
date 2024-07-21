// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hype_kicks/colors.dart';
// import 'package:hype_kicks/enums.dart';
// import 'package:hype_kicks/providers/cart_provider.dart';
// import 'package:hype_kicks/screens/payment_successful_screen.dart';
// import 'package:hype_kicks/services/cache_service.dart';

// class CartScreen extends ConsumerStatefulWidget {
//   const CartScreen({super.key});

//   static const cartScreen = '/cart-screen';

//   @override
//   ConsumerState<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends ConsumerState<CartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var cartShoesService = ref.watch(cacheServiceProvider);
//     final subtotal = ref.read(cartProviderProvider.notifier).subtotalPrice;
//     final deliveryFee = ref.read(cartProviderProvider.notifier).delivery;
//     final discount = ref.read(cartProviderProvider.notifier).discount;
//     final total = ref.read(cartProviderProvider.notifier).totalPrice();

//     // final cartShoes = ModalRoute.of(context)!.settings.arguments as List<Shoe>;
//     // print(cartShoes);
//     return Scaffold(
//       appBar: AppBar(),
//       body: cartShoesService.when(
//         loading: () {
//           return const Center(
//             child: Text('loading...'),
//             // child: CircularProgressIndicator.adaptive(),
//           );
//         },
//         error: (e, _) {
//           return const Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.cancel_outlined,
//                   size: 100.0,
//                   color: Colors.red,
//                 ),
//                 Text('Failed to load hyper kicks'),
//               ],
//             ),
//           );
//         },
//         data: (cartShoes) {
//           if (cartShoes.isEmpty) {
//             return const Center(
//               child: Text('Nothing added to cart yet'),
//             );
//           }
//           return SingleChildScrollView(
//             child: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   left: 16.0,
//                   top: 11.98,
//                   right: 16.0,
//                   bottom: 20.0,
//                 ),
//                 child: Column(
//                   children: [
//                     ListView.builder(
//                         physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: cartShoes.length,
//                         itemBuilder: (_, i) {
//                           return Column(
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(16.0),
//                                 height: 152.0,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   border: Border.all(
//                                     color:
//                                         const Color.fromRGBO(249, 249, 249, 1),
//                                   ),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Container(
//                                           height: 120.0,
//                                           width: 100.0,
//                                           decoration: BoxDecoration(
//                                             color: const Color.fromRGBO(
//                                                 234, 234, 234, 0.4),
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                             image: DecorationImage(
//                                               image: NetworkImage(
//                                                   cartShoes[i].photoUrls.first),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(width: 16.0),
//                                         SizedBox(
//                                           height: 100.0,
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 cartShoes[i].name,
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .labelLarge!
//                                                     .copyWith(
//                                                       color: gray500,
//                                                       fontSize: 15.0,
//                                                     ),
//                                               ),
//                                               const SizedBox(height: 8.0),
//                                               Row(
//                                                 children: [
//                                                   Container(
//                                                     width: 25.0,
//                                                     height: 24.0,
//                                                     decoration: BoxDecoration(
//                                                       color: CartShoe
//                                                           .values[i].shoeColor,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               4.0),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(width: 4.0),
//                                                   Text(
//                                                     CartShoe.values[i].name,
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .titleSmall!
//                                                         .copyWith(
//                                                           fontSize: 12.0,
//                                                           color: gray400,
//                                                         ),
//                                                   ),
//                                                   const SizedBox(width: 8.0),
//                                                   SvgPicture.asset(
//                                                       'assets/vertical_line.svg'),
//                                                   const SizedBox(width: 8.0),
//                                                   Text(
//                                                     'Size',
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyMedium!
//                                                         .copyWith(
//                                                           fontSize: 15.0,
//                                                           color: gray500,
//                                                         ),
//                                                   ),
//                                                   const SizedBox(width: 4.0),
//                                                   Container(
//                                                     width: 25.0,
//                                                     height: 26.0,
//                                                     decoration: BoxDecoration(
//                                                       color: secondary50,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               4.0),
//                                                     ),
//                                                     child: Center(
//                                                       child: Text(
//                                                         '${CartShoeSize.values[i].shoeSize}',
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 16.0),
//                                               Row(
//                                                 children: [
//                                                   Container(
//                                                     width: 25.0,
//                                                     height: 26.0,
//                                                     decoration: BoxDecoration(
//                                                       color:
//                                                           const Color.fromRGBO(
//                                                               0,
//                                                               114,
//                                                               198,
//                                                               0.12),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               4.0),
//                                                     ),
//                                                     child: const Center(
//                                                       child: Text(
//                                                         '1',
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(width: 8.0),
//                                                   SvgPicture.asset(
//                                                       'assets/vertical_line.svg'),
//                                                   const SizedBox(width: 8.0),
//                                                   Text(
//                                                     cartShoes[i].formattedPrice,
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .labelLarge!
//                                                         .copyWith(
//                                                           fontSize: 15.0,
//                                                           color: gray500,
//                                                         ),
//                                                   ),
//                                                 ],
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         IconButton(
//                                           onPressed: () {
//                                             ref
//                                                 .read(cacheServiceProvider
//                                                     .notifier)
//                                                 .deleteShoe(cartShoes[i].id);
//                                           },
//                                           icon: const Icon(Icons.delete),
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 20.0),
//                             ],
//                           );
//                         }),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Personal information',
//                           style:
//                               Theme.of(context).textTheme.labelLarge!.copyWith(
//                                     color: gray500,
//                                     fontSize: 15.0,
//                                   ),
//                         ),
//                         Text(
//                           'Edit',
//                           style:
//                               Theme.of(context).textTheme.labelMedium!.copyWith(
//                                     color: darkBlue,
//                                     fontSize: 15.0,
//                                   ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 12.0),
//                     Container(
//                       padding: const EdgeInsets.all(16.0),
//                       height: 74.0,
//                       decoration: BoxDecoration(
//                         color: secondary50,
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: const Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               PersonalInfo(
//                                 svg: 'assets/contact.svg',
//                                 title: 'Ada Dennisit',
//                               ),
//                               PersonalInfo(
//                                 svg: 'assets/smart_phone.svg',
//                                 title: '09100000000',
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 10.0),
//                           PersonalInfo(
//                             svg: 'assets/mail.svg',
//                             title: 'ad@gmail.com',
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 30.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Delivery option',
//                           style:
//                               Theme.of(context).textTheme.labelLarge!.copyWith(
//                                     color: gray500,
//                                     fontSize: 15.0,
//                                   ),
//                         ),
//                         Text(
//                           'Edit',
//                           style:
//                               Theme.of(context).textTheme.labelMedium!.copyWith(
//                                     color: darkBlue,
//                                     fontSize: 15.0,
//                                   ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(16.0),
//                       height: 48.0,
//                       decoration: BoxDecoration(
//                         color: secondary50,
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const PersonalInfo(
//                             svg: 'assets/delivery.svg',
//                             title: 'Pick up point',
//                           ),
//                           Text(
//                             'Ikeja, Lagos',
//                             style:
//                                 Theme.of(context).textTheme.bodySmall!.copyWith(
//                                       color: gray500,
//                                     ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 30.0),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Price summary',
//                           style:
//                               Theme.of(context).textTheme.labelLarge!.copyWith(
//                                     color: gray500,
//                                     fontSize: 15.0,
//                                   ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(16.0),
//                           height: 165.0,
//                           decoration: BoxDecoration(
//                             color: secondary50,
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Column(
//                             children: [
//                               SummaryItem(
//                                 title: 'Total price',
//                                 amount: subtotal,
//                               ),
//                               SummaryItem(
//                                 title: 'Delivery fee',
//                                 amount: deliveryFee.toString(),
//                               ),
//                               SummaryItem(
//                                 title: 'Discount',
//                                 amount: discount.toString(),
//                               ),
//                               const SizedBox(height: 20.0),
//                               SvgPicture.asset('assets/line5.svg'),
//                               const SizedBox(height: 20.0),
//                               SummaryItem(title: 'Total', amount: total)
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 58.0),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SizedBox(
//                               height: 42.0,
//                               child: ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                   ),
//                                   backgroundColor: secondary50,
//                                 ),
//                                 child: Text(
//                                   'Cancel',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyLarge!
//                                       .copyWith(
//                                         color: gray500,
//                                         fontSize: 15.0,
//                                       ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 42.0,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   showModalBottomSheet(
//                                       context: context,
//                                       builder: (_) {
//                                         return SizedBox(
//                                           height: 537.0,
//                                           child: SingleChildScrollView(
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   top: 16.0,
//                                                   left: 20.0,
//                                                   right: 20.0,
//                                                   bottom: 29.0),
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceBetween,
//                                                     children: [
//                                                       Text(
//                                                         'Select a payment option',
//                                                         style: Theme.of(context)
//                                                             .textTheme
//                                                             .bodyLarge!
//                                                             .copyWith(
//                                                               color: gray500,
//                                                               fontSize: 15.0,
//                                                             ),
//                                                       ),
//                                                       IconButton(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .only(
//                                                           left: 15.0,
//                                                         ),
//                                                         onPressed: () =>
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pop(),
//                                                         icon: SvgPicture.asset(
//                                                             'assets/x.svg'),
//                                                       )
//                                                     ],
//                                                   ),
//                                                   const SizedBox(height: 15.0),
//                                                   Container(
//                                                     padding: const EdgeInsets
//                                                         .symmetric(
//                                                       horizontal: 24.0,
//                                                       vertical: 20.0,
//                                                     ),
//                                                     height: 74.0,
//                                                     decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                           color: gray50),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8.0),
//                                                     ),
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Row(
//                                                           children: [
//                                                             Container(
//                                                               height: 32.0,
//                                                               width: 46.0,
//                                                               decoration: BoxDecoration(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               6.0)),
//                                                               child: SvgPicture
//                                                                   .asset(
//                                                                       'assets/mastercard.svg'),
//                                                             ),
//                                                             const SizedBox(
//                                                                 width: 8.0),
//                                                             Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Text(
//                                                                   '**** **** **** 1234',
//                                                                   style: Theme.of(
//                                                                           context)
//                                                                       .textTheme
//                                                                       .bodySmall!
//                                                                       .copyWith(
//                                                                         color:
//                                                                             neutral,
//                                                                       ),
//                                                                 ),
//                                                                 Text(
//                                                                   '05/24',
//                                                                   style: Theme.of(
//                                                                           context)
//                                                                       .textTheme
//                                                                       .bodySmall!
//                                                                       .copyWith(
//                                                                         color:
//                                                                             neutral,
//                                                                       ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         SvgPicture.asset(
//                                                             'assets/check.svg')
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   const SizedBox(height: 8.0),
//                                                   Text(
//                                                     'Add a new Card',
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .labelMedium!
//                                                         .copyWith(
//                                                           fontSize: 15.0,
//                                                           color: darkBlue,
//                                                         ),
//                                                   ),
//                                                   const SizedBox(height: 20.0),
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Text(
//                                                         'Full name',
//                                                         style: Theme.of(context)
//                                                             .textTheme
//                                                             .titleSmall!
//                                                             .copyWith(
//                                                               color: gray500,
//                                                               fontSize: 13,
//                                                             ),
//                                                       ),
//                                                       const SizedBox(
//                                                           height: 4.0),
//                                                       TextField(
//                                                         decoration:
//                                                             InputDecoration(
//                                                           label: Text(
//                                                             'Enter your full name',
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .titleSmall!
//                                                                 .copyWith(
//                                                                   color:
//                                                                       gray200,
//                                                                   fontSize: 12,
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                   const SizedBox(height: 20.0),
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Text(
//                                                         'email address',
//                                                         style: Theme.of(context)
//                                                             .textTheme
//                                                             .titleSmall!
//                                                             .copyWith(
//                                                               color: gray500,
//                                                               fontSize: 13,
//                                                             ),
//                                                       ),
//                                                       const SizedBox(
//                                                           height: 4.0),
//                                                       TextField(
//                                                         decoration:
//                                                             InputDecoration(
//                                                           label: Text(
//                                                             'Enter your email address',
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .titleSmall!
//                                                                 .copyWith(
//                                                                   color:
//                                                                       gray200,
//                                                                   fontSize: 12,
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                   const SizedBox(height: 20.0),
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Text(
//                                                         'Phone number',
//                                                         style: Theme.of(context)
//                                                             .textTheme
//                                                             .titleSmall!
//                                                             .copyWith(
//                                                               color: gray500,
//                                                               fontSize: 13,
//                                                             ),
//                                                       ),
//                                                       const SizedBox(
//                                                           height: 4.0),
//                                                       TextField(
//                                                         decoration:
//                                                             InputDecoration(
//                                                           label: Text(
//                                                             'Enter your phone number',
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .titleSmall!
//                                                                 .copyWith(
//                                                                   color:
//                                                                       gray200,
//                                                                   fontSize: 12,
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       const SizedBox(
//                                                           height: 46.0),
//                                                       SizedBox(
//                                                         width: double.infinity,
//                                                         height: 42.0,
//                                                         child: ElevatedButton(
//                                                           onPressed: () async {
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pushNamed(
//                                                                     PaymentSuccessfulScreen
//                                                                         .paymentSuccessfulScreen);
//                                                           },
//                                                           style: ElevatedButton
//                                                               .styleFrom(
//                                                             shape:
//                                                                 RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           8.0),
//                                                             ),
//                                                             backgroundColor:
//                                                                 darkBlue,
//                                                           ),
//                                                           child: Text(
//                                                             'Proceed to payment',
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .bodyLarge!
//                                                                 .copyWith(
//                                                                   color: Colors
//                                                                       .white,
//                                                                   fontSize:
//                                                                       15.0,
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       });
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                   ),
//                                   backgroundColor: darkBlue,
//                                 ),
//                                 child: Text(
//                                   'Proceed',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyLarge!
//                                       .copyWith(
//                                         color: Colors.white,
//                                         fontSize: 15.0,
//                                       ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class SummaryItem extends StatelessWidget {
//   const SummaryItem({
//     super.key,
//     required this.title,
//     required this.amount,
//   });

//   final String title;
//   final String amount;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                 fontSize: 15.0,
//                 color: gray400,
//               ),
//         ),
//         SizedBox(
//           width: 100.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 '₦',
//                 style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                       fontSize: 15.0,
//                       color: gray400,
//                     ),
//               ),
//               Text(
//                 amount,
//                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                       fontSize: 15.0,
//                       color: gray500,
//                     ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class PersonalInfo extends StatelessWidget {
//   const PersonalInfo({
//     super.key,
//     required this.svg,
//     required this.title,
//   });

//   final String svg;
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SvgPicture.asset(svg),
//         const SizedBox(width: 8.0),
//         Text(
//           title,
//           style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                 color: gray500,
//               ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hype_kicks/colors.dart';
import 'package:hype_kicks/enums.dart';
import 'package:hype_kicks/models/shoe.dart';
import 'package:hype_kicks/models/shoe_cache.dart';
import 'package:hype_kicks/providers/cart_provider.dart';
import 'package:hype_kicks/screens/payment_successful_screen.dart';
import 'package:hype_kicks/services/cache_service.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  static const cartScreen = '/cart-screen';

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartShoes = ref.watch(cartProviderProvider);
    final subtotal = ref.read(cartProviderProvider.notifier).subtotalPrice;
    final deliveryFee = ref.read(cartProviderProvider.notifier).delivery;
    final discount = ref.read(cartProviderProvider.notifier).discount;
    final total = ref.read(cartProviderProvider.notifier).totalPrice();

    if (cartShoes.isEmpty) print('empty');
    // final cartShoes = ModalRoute.of(context)!.settings.arguments as List<Shoe>;
    // print(cartShoes);
    return Scaffold(
      appBar: AppBar(),
      body: cartShoes.isNotEmpty
          ? SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 11.98,
                    right: 16.0,
                    bottom: 20.0,
                  ),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartShoes.length,
                        itemBuilder: (_, i) {
                          return Column(
                            children: [
                              CartItem(cartShoes: cartShoes, ref: ref, i: i),
                              const SizedBox(height: 20.0),
                              const PersonalInformation(),
                              const SizedBox(height: 30.0),
                              const DeliveryOption(),
                              const SizedBox(height: 30.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PriceSummary(
                                      subtotal: subtotal,
                                      deliveryFee: deliveryFee,
                                      discount: discount,
                                      total: total),
                                  const SizedBox(height: 58.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 42.0,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            backgroundColor: secondary50,
                                          ),
                                          child: Text(
                                            'Cancel',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: gray500,
                                                  fontSize: 15.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 42.0,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            ref
                                                .read(cacheServiceProvider
                                                    .notifier)
                                                .addShoe(
                                                  ShoeCache(
                                                    name: cartShoes[i].name,
                                                    category:
                                                        cartShoes[i].category,
                                                    id: cartShoes[i].id,
                                                    photoUrls:
                                                        cartShoes[i].photoUrls,
                                                    price: cartShoes[i].price,
                                                    quantity:
                                                        cartShoes[i].quantity,
                                                  ),
                                                );
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (_) {
                                                  return SizedBox(
                                                    height: 537.0,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 16.0,
                                                                left: 20.0,
                                                                right: 20.0,
                                                                bottom: 29.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Select a payment option',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyLarge!
                                                                      .copyWith(
                                                                        color:
                                                                            gray500,
                                                                        fontSize:
                                                                            15.0,
                                                                      ),
                                                                ),
                                                                IconButton(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    left: 15.0,
                                                                  ),
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                  icon: SvgPicture
                                                                      .asset(
                                                                          'assets/x.svg'),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 15.0),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    24.0,
                                                                vertical: 20.0,
                                                              ),
                                                              height: 74.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        gray50),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            32.0,
                                                                        width:
                                                                            46.0,
                                                                        decoration:
                                                                            BoxDecoration(borderRadius: BorderRadius.circular(6.0)),
                                                                        child: SvgPicture.asset(
                                                                            'assets/mastercard.svg'),
                                                                      ),
                                                                      const SizedBox(
                                                                          width:
                                                                              8.0),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            '**** **** **** 1234',
                                                                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                                                  color: neutral,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '05/24',
                                                                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                                                  color: neutral,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SvgPicture.asset(
                                                                      'assets/check.svg')
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 8.0),
                                                            Text(
                                                              'Add a new Card',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelMedium!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        15.0,
                                                                    color:
                                                                        darkBlue,
                                                                  ),
                                                            ),
                                                            const SizedBox(
                                                                height: 20.0),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Full name',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleSmall!
                                                                      .copyWith(
                                                                        color:
                                                                            gray500,
                                                                        fontSize:
                                                                            13,
                                                                      ),
                                                                ),
                                                                const SizedBox(
                                                                    height:
                                                                        4.0),
                                                                TextField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    label: Text(
                                                                      'Enter your full name',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleSmall!
                                                                          .copyWith(
                                                                            color:
                                                                                gray200,
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 20.0),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'email address',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleSmall!
                                                                      .copyWith(
                                                                        color:
                                                                            gray500,
                                                                        fontSize:
                                                                            13,
                                                                      ),
                                                                ),
                                                                const SizedBox(
                                                                    height:
                                                                        4.0),
                                                                TextField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    label: Text(
                                                                      'Enter your email address',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleSmall!
                                                                          .copyWith(
                                                                            color:
                                                                                gray200,
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 20.0),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Phone number',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleSmall!
                                                                      .copyWith(
                                                                        color:
                                                                            gray500,
                                                                        fontSize:
                                                                            13,
                                                                      ),
                                                                ),
                                                                const SizedBox(
                                                                    height:
                                                                        4.0),
                                                                TextField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    label: Text(
                                                                      'Enter your phone number',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleSmall!
                                                                          .copyWith(
                                                                            color:
                                                                                gray200,
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height:
                                                                        46.0),
                                                                SizedBox(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 42.0,
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () async {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pushNamed(
                                                                              PaymentSuccessfulScreen.paymentSuccessfulScreen);
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      backgroundColor:
                                                                          darkBlue,
                                                                    ),
                                                                    child: Text(
                                                                      'Proceed to payment',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodyLarge!
                                                                          .copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                15.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            backgroundColor: darkBlue,
                                          ),
                                          child: Text(
                                            'Proceed',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 15.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const Center(
              child: Text('Nothing added to cart yet'),
            ),
    );
  }
}

class PriceSummary extends StatelessWidget {
  const PriceSummary({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.discount,
    required this.total,
  });

  final String subtotal;
  final double deliveryFee;
  final double discount;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price summary',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: gray500,
                fontSize: 15.0,
              ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          height: 165.0,
          decoration: BoxDecoration(
            color: secondary50,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              SummaryItem(
                title: 'Total price',
                amount: subtotal,
              ),
              SummaryItem(
                title: 'Delivery fee',
                amount: deliveryFee.toString(),
              ),
              SummaryItem(
                title: 'Discount',
                amount: discount.toString(),
              ),
              const SizedBox(height: 20.0),
              SvgPicture.asset('assets/line5.svg'),
              const SizedBox(height: 20.0),
              SummaryItem(title: 'Total', amount: total)
            ],
          ),
        ),
      ],
    );
  }
}

class DeliveryOption extends StatelessWidget {
  const DeliveryOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery option',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: gray500,
                    fontSize: 15.0,
                  ),
            ),
            Text(
              'Edit',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: darkBlue,
                    fontSize: 15.0,
                  ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          height: 48.0,
          decoration: BoxDecoration(
            color: secondary50,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PersonalInfo(
                svg: 'assets/delivery.svg',
                title: 'Pick up point',
              ),
              Text(
                'Ikeja, Lagos',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: gray500,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Personal information',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: gray500,
                    fontSize: 15.0,
                  ),
            ),
            Text(
              'Edit',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: darkBlue,
                    fontSize: 15.0,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Container(
          padding: const EdgeInsets.all(16.0),
          height: 74.0,
          decoration: BoxDecoration(
            color: secondary50,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PersonalInfo(
                    svg: 'assets/contact.svg',
                    title: 'Ada Dennisit',
                  ),
                  PersonalInfo(
                    svg: 'assets/smart_phone.svg',
                    title: '09100000000',
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              PersonalInfo(
                svg: 'assets/mail.svg',
                title: 'ad@gmail.com',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartShoes,
    required this.ref,
    required this.i,
  });

  final List<Shoe> cartShoes;
  final WidgetRef ref;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 152.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color.fromRGBO(249, 249, 249, 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 120.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(234, 234, 234, 0.4),
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(cartShoes[i].photoUrls.first),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartShoes[i].name,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: gray500,
                            fontSize: 15.0,
                          ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Container(
                          width: 25.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: CartShoe.values[i].shoeColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          CartShoe.values[i].name,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 12.0,
                                    color: gray400,
                                  ),
                        ),
                        const SizedBox(width: 8.0),
                        SvgPicture.asset('assets/vertical_line.svg'),
                        const SizedBox(width: 8.0),
                        Text(
                          'Size',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 15.0,
                                    color: gray500,
                                  ),
                        ),
                        const SizedBox(width: 4.0),
                        Container(
                          width: 25.0,
                          height: 26.0,
                          decoration: BoxDecoration(
                            color: secondary50,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Center(
                            child: Text(
                              '${CartShoeSize.values[i].shoeSize}',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Container(
                          width: 25.0,
                          height: 26.0,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 114, 198, 0.12),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: const Center(
                            child: Text(
                              '1',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        SvgPicture.asset('assets/vertical_line.svg'),
                        const SizedBox(width: 8.0),
                        Text(
                          cartShoes[i].formattedPrice,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 15.0,
                                    color: gray500,
                                  ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  ref
                      .read(cartProviderProvider.notifier)
                      .removeShoe(cartShoes[i].id);
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.title,
    required this.amount,
  });

  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 15.0,
                color: gray400,
              ),
        ),
        SizedBox(
          width: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₦',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 15.0,
                      color: gray400,
                    ),
              ),
              Text(
                amount,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 15.0,
                      color: gray500,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
    required this.svg,
    required this.title,
  });

  final String svg;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(svg),
        const SizedBox(width: 8.0),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: gray500,
              ),
        ),
      ],
    );
  }
}
