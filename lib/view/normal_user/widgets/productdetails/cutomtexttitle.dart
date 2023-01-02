import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

class CustomTextTitle extends StatelessWidget {
  final String title;
  const CustomTextTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline1!.copyWith(
            color: Colors.grey[800],
          ),
    );
  }
}
