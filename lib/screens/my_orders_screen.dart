import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hype_kicks/utils/colors.dart';
import 'package:hype_kicks/utils/enums.dart';
import 'package:hype_kicks/screens/wishlist_screen.dart';
import 'package:hype_kicks/services/cache_service.dart';

class MyOrdersScreen extends ConsumerWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: gray500,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3.0,
            labelColor: gray500,
            tabs: [
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: Text(
                    'Active Orders',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: gray500, fontSize: 15.0),
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: Text(
                    'Completed orders',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: gray500, fontSize: 15.0),
                  ),
                ),
              ),
            ],
          ),
          flexibleSpace: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/ag.svg'),
                  Row(
                    children: [
                      SvgPicture.asset('assets/search.svg'),
                      const SizedBox(width: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: SizedBox(
                          width: 30.0,
                          height: 30.0,
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
        body: const TabBarView(children: [
          ActiveOrders(),
          CompletedOrders(),
        ]),
      ),
    );
  }
}

class ActiveOrders extends ConsumerWidget {
  const ActiveOrders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeOrders = ref.read(cacheServiceProvider);
    return Scaffold(
      body: activeOrders.when(
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
        data: (activeShoes) {
          if (activeShoes.isEmpty) {
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 27.98, left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/no_order.svg'),
                    const SizedBox(height: 20.0),
                    Text(
                      'You do not have any active order',
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
                  itemCount: activeShoes.length,
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
                                        activeShoes[i].photoUrls.first),
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
                                      activeShoes[i].name,
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
                                      activeShoes[i].formattedPrice,
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

class CompletedOrders extends ConsumerWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var completedOrders = ref.read(cacheServiceProvider);
    return Scaffold(
      body: completedOrders.when(
        loading: () {
          return const Center(
            child: Text('loading...'),
            // child: CircularProgressIndicator.adaptive(),
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
        data: (completedShoes) {
          if (completedShoes.isEmpty) {
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 27.98, left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/no_order.svg'),
                    const SizedBox(height: 20.0),
                    Text(
                      'No completed order yet',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: gray500, fontSize: 15.0),
                    ),
                  ],
                ),
              ),
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
                  itemCount: completedShoes.length,
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
                                        completedShoes[i].photoUrls.first),
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
                                      completedShoes[i].name,
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
                                      completedShoes[i].formattedPrice,
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
