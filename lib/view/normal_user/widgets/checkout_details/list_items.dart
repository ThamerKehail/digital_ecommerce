import 'package:flutter/material.dart';

import '../../../../data/model/cartitemmodel.dart';
import 'items_card.dart';

class ListItems extends StatelessWidget {
  final List items;
  const ListItems({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 150,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 12,
              ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemsCard(
              itemsModel: CartItemModel.fromJson(items[index]),
            );
          }),
    );
  }
}
