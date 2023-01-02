import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String titleAppBar;
  final void Function() onPressed;
  final void Function() onPressedSearch;
  final void Function(String)? onPressedSearch2;
  final TextEditingController? controller;
  const CustomAppbar(
      {Key? key,
      required this.titleAppBar,
      required this.onPressed,
      required this.onPressedSearch,
      this.onPressedSearch2,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: controller,
            onFieldSubmitted: onPressedSearch2,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20)),
              prefixIcon: IconButton(
                  onPressed: onPressedSearch, icon: const Icon(Icons.search)),
              hintText: titleAppBar,
              hintStyle: const TextStyle(
                fontSize: 18,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
              onPressed: onPressed,
            ),
          )
        ],
      ),
    );
  }
}
