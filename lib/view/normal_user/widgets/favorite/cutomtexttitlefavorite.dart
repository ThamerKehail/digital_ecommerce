import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

class CustomFavoriteTextTitle extends StatelessWidget {
  final String title;
  const CustomFavoriteTextTitle({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline1!.copyWith(
            color: ColorApp.primaryColor,
          ),
    );
  }
}
