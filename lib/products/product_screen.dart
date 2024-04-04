import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_bloc/products/bloc/product_bloc.dart';
import 'package:jkb_bloc/products/bloc/product_event.dart';
import 'package:jkb_bloc/products/bloc/product_state.dart';
import 'package:jkb_bloc/products/favourite_screen.dart';
import 'package:jkb_bloc/products/model/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductEventLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FavouriteScreen(),
                ),
              );
            },
            icon: const Icon(Icons.favorite_outline),
            label: const Text('Favourites'),
          )
        ],
      ),
      body: const ProductListView(),
    );
  }
}

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        log('listener called');
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            final productModel = state.products[index];
            return ListItemWidget(
              productModel: productModel,
            );
          },
        );
      },
    );
  }
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Image(
            fit: BoxFit.cover,
            width: 160,
            height: 160,
            image: NetworkImage(productModel.imageUrl),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '\$ ${productModel.price}',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  productModel.isFavourite
                      ? UnFavouriteButton(productModel: productModel)
                      : FavouriteButton(productModel: productModel),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: () {
        context.read<ProductBloc>().add(
              ProductEventFavourite(
                productModel: productModel,
              ),
            );
      },
      icon: const Icon(Icons.favorite_outline),
    );
  }
}

class UnFavouriteButton extends StatelessWidget {
  const UnFavouriteButton({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        context.read<ProductBloc>().add(
              ProductEventUnFavourite(
                productModel: productModel,
              ),
            );
      },
      icon: const Icon(Icons.favorite_outlined),
    );
  }
}
