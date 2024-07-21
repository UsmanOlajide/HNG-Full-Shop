import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hype_kicks/colors.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({super.key});

  static const paymentSuccessfulScreen = '/payment-successful';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/success.svg'),
              const SizedBox(height: 8.0),
              Text(
                'Payment successful',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 19.0,
                      color: gray500,
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'You have successfully placed an order. Details of your order has been sent to your email.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15.0,
                      color: gray300,
                    ),
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                width: double.infinity,
                height: 42.0,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: darkBlue,
                  ),
                  child: Text(
                    'Okay',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
