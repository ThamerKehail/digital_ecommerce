import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/paymentmethodeenum.dart';

class ChoosePaymentMethodCard extends StatelessWidget {
  final SingingCharacter character;
  final SingingCharacter value;
  final void Function(SingingCharacter?) onChange;
  final String image;
  final String title;

  const ChoosePaymentMethodCard(
      {Key? key,
      required this.character,
      required this.onChange,
      required this.value,
      required this.image,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: 75,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 20,
                fontFamily: 'sans',
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Radio<SingingCharacter>(
              activeColor: ColorApp.primaryColor,
              value: value,
              groupValue: character,
              onChanged: onChange,
            ),
          ],
        ),
      ),
    );
  }
}
