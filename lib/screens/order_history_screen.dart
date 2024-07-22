import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hype_kicks/utils/colors.dart';
import 'package:hype_kicks/utils/enums.dart';
import 'package:hype_kicks/services/cache_service.dart';

class OrderHistoryScreen extends ConsumerWidget {
  const OrderHistoryScreen({super.key});

  static const orderHistory = '/order-history';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartShoesService = ref.watch(cacheServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: cartShoesService.when(
        loading: () {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
        error: (e, _) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cancel_outlined,
                  size: 100.0,
                  color: Colors.red,
                ),
                Text('Failed to load order history'),
              ],
            ),
          );
        },
        data: (cartShoes) {
          if (cartShoes.isEmpty) {
            return const Center(
              child: Text('Nothing added to cart yet'),
            );
          }
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 11.98,
                  right: 16.0,
                  bottom: 20.0,
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartShoes.length,
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 20.0,
                          ),
                          height: 160.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: const Color.fromRGBO(249, 249, 249, 1),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 120.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(234, 234, 234, 0.4),
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        cartShoes[i].photoUrls.first),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
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
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          CartShoe.values[i].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 12.0,
                                                color: gray400,
                                              ),
                                        ),
                                        const SizedBox(width: 8.0),
                                        SvgPicture.asset(
                                            'assets/vertical_line.svg'),
                                        const SizedBox(width: 8.0),
                                        Text(
                                          'Size',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
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
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${CartShoeSize.values[i].shoeSize}',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      cartShoes[i].formattedPrice,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            fontSize: 15.0,
                                            color: gray500,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
