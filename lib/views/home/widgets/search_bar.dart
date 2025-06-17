import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 5),
                spreadRadius: 3,
                color: Colors.black12,
                blurRadius: 12),
          ]),
      child: TextField(
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: const Icon(
              Iconsax.search_normal,
              color: Colors.black54,
              size: 22,
            ),
            hintText: 'Search for grocery',
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
            )),
      ),
    );
  }
}
