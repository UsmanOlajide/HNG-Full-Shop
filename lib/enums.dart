import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum Brand {
  nike('Nike', 'assets/nike.svg'),
  gucci('Gucci', 'assets/gucci.svg'),
  jordan('Jordan', 'assets/jordan.svg'),
  balenciaga('Balenciaga', 'assets/balenciaga.svg'),
  adidas('Adidas', 'assets/adidas.svg'),
  reebok('Reebok', 'assets/reebok.svg'),
  newBalance('New Balance', 'assets/new_balance.svg');

  final String name;
  final String imagePath;

  const Brand(this.name, this.imagePath);

  static List<Widget> get brandList {
    return Brand.values.map((brand) => Text(brand.name)).toList();
  }

  static List<Widget> get allValues {
    return Brand.values.map(
      (brand) {
        return Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                brand.imagePath,
                fit: BoxFit.scaleDown,
              ),
            ),
            Text(
              brand.name,
              // style: Theme.of(context).textTheme.bodySmall!.copyWith(
              //       fontSize: 10,
              //     ),
            )
          ],
        );
      },
    ).toList();
  }
}

enum ShoeSize {
  thirty2(32),
  thirty5(35),
  thirty8(38),
  thirty9(39),
  forty(40),
  forty2(42),
  forty5(45);

  final int shoeSize;
  const ShoeSize(this.shoeSize);
}

enum ShoeColor {
  orange('Orange', Color(0xFFFFA500)),
  purple('Purple', Color(0xFF9747FF)),
  green('Green', Color(0xFF09C53B)),
  blue('Blue', Color(0xFF0266B8)),
  yellow('Yellow', Color(0xFFFFCD00)),
  red('Red', Color(0xFFEC064F)),
  black('Black', Color(0xFF141B34));

  final String name;
  final Color shoeColor;
  const ShoeColor(this.name, this.shoeColor);
}

enum CartShoe {
  black('Black', Color(0xFF141B34)),
  pink('Pink', Color(0xFFEC064F)),
  orange('Orange', Color(0xFFFFA500)),
  blue('Blue', Color(0xFF0266B8));

  final String name;
  final Color shoeColor;
  const CartShoe(this.name, this.shoeColor);
}

enum CartShoeSize {
  thirty9(39),
  thirty8(38),
  forty(40),
  forty1(41);

  final int shoeSize;
  const CartShoeSize(this.shoeSize);
}
