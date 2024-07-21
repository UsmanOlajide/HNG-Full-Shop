import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hype_kicks/colors.dart';
import 'package:hype_kicks/models/shoe.dart';
import 'package:hype_kicks/providers/cart_provider.dart';
import 'package:hype_kicks/providers/favorite_provider.dart';
import 'package:hype_kicks/screens/shoe_details_screen.dart';

class BuildGrid extends ConsumerWidget {
  const BuildGrid({super.key, required this.shoes});

  final List<Shoe> shoes;
  // final void Function()? onTap;
  // final bool isLiked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favoriteShoes = ref.watch(favoriteProviderProvider);
    var cartShoes = ref.watch(cartProviderProvider);

    // final moreShoes = [shoes[8], shoes[3], shoes[0], shoes[10]];
    // final moreShoes = [shoes[6], shoes[12], shoes[5], shoes[11]];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: shoes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.5,
        crossAxisCount: 2,
        crossAxisSpacing: 21.0,
      ),
      itemBuilder: (context, index) {
        var isLiked = ref
            .read(favoriteProviderProvider.notifier)
            .isFavorite(shoes[index].id);
        return LayoutBuilder(
          builder: (context, constraints) {
            final maxHeight = constraints.maxHeight;
            // print(constraints);
            return Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                          ShoeDetailsScreen.detailsScreen,
                          arguments: {
                            'shoe': shoes[index],
                            'moreShoes': shoes,
                          }),
                      child: Container(
                        height: maxHeight * 0.6,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: gray50,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(shoes[index].photoUrls.first),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.2,
                      child: GestureDetector(
                        // onTap: onTap,
                        // onTap: () => setState(() => isLiked = !isLiked),
                        onTap: () {
                          ref
                              .read(favoriteProviderProvider.notifier)
                              .addFavorite(shoes[index]);
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
                // Container(
                //   height: 92,
                //   color: Colors.red[400],
                // ),
                SizedBox(
                  height: maxHeight * 0.36,
                  // color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoes[index].category.first,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 10.0,
                              color: gray500,
                            ),
                      ),
                      Text(
                        shoes[index].name,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: gray500,
                                ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          SvgPicture.asset('assets/star-half.svg'),
                          const SizedBox(width: 4.0),
                          Text(
                            '4.5 (100 sold)',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 10.0,
                                  color: gray500,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shoes[index].discountPrice,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: darkBlue,
                                    ),
                              ),
                              Text(
                                shoes[index].formattedPrice,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: gray200,
                                        decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(cartProviderProvider.notifier)
                                  .addShoe(shoes[index]);
                              print('object');
                              print(cartShoes);
                            },
                            child: Container(
                              // padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                              width: 36.0,
                              height: 28.0,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 114, 198, 0.12),
                                borderRadius: BorderRadius.circular(8.0),
                              ),

                              child: ref
                                      .read(cartProviderProvider.notifier)
                                      .isPresent(shoes[index].id)
                                  ? const Icon(
                                      Icons.done,
                                      color: darkBlue,
                                    )
                                  : SvgPicture.asset(
                                      'assets/basket.svg',
                                      fit: BoxFit.scaleDown,
                                    ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
