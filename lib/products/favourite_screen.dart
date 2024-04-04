import 'package:flutter/material.dart';
import 'package:jkb_bloc/products/product_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: const ProductListView(),
    );
  }
}
