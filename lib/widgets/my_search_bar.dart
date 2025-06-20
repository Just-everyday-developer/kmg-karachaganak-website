import 'package:flutter/material.dart';
import '../controllers/search_controller.dart' as custom;

class MySearchBar extends StatelessWidget {
  final custom.SearchController searchController;
  const MySearchBar({required this.searchController, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextField(
        controller: searchController.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: searchController.clear,
          ),
          hintText: 'Search',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}