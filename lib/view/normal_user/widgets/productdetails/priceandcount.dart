import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class PriceAndCount extends StatelessWidget {
  final String price;
  final String q;
  final void Function() add;
  final void Function() remove;
  const PriceAndCount(
      {Key? key,
      required this.price,
      required this.q,
      required this.add,
      required this.remove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(onPressed: add, icon: const Icon(Icons.add)),
              Container(
                width: 50,
                padding: const EdgeInsets.only(bottom: 5),
                alignment: Alignment.topCenter,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  q,
                  style: const TextStyle(fontSize: 20, height: 1.1),
                ),
              ),
              IconButton(onPressed: remove, icon: const Icon(Icons.remove)),
            ],
          ),
          const Spacer(),
          Text(
            '$price JD ',
            style: const TextStyle(
                color: ColorApp.primaryColor, fontSize: 30, height: 1.1),
          )
        ],
      ),
    );
  }
}
