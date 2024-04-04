import 'package:jkb_bloc/products/model/product_model.dart';

abstract class ProductEvent {}

class ProductEventLoad extends ProductEvent {}

class ProductEventFavourite extends ProductEvent {
  final ProductModel productModel;
  ProductEventFavourite({
    required this.productModel,
  });
}

class ProductEventUnFavourite extends ProductEvent {
  final ProductModel productModel;
  ProductEventUnFavourite({
    required this.productModel,
  });
}
