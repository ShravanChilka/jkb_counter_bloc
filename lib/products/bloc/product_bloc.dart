import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_bloc/products/bloc/product_event.dart';
import 'package:jkb_bloc/products/bloc/product_state.dart';
import 'package:jkb_bloc/products/model/product_model.dart';

List<ProductModel> _products = [
  const ProductModel(
    id: 1,
    name: 'Red Nike Sneaker',
    price: 100,
    imageUrl:
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const ProductModel(
    id: 2,
    name: 'Unpaired Maroon Plimsoll',
    price: 120,
    imageUrl:
        'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?q=80&w=2596&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  const ProductModel(
    id: 3,
    name: 'Green Athletic Shoe',
    price: 160,
    imageUrl:
        'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
];

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc()
      : super(
          ProductState(
            products: [],
          ),
        ) {
    on<ProductEventLoad>((event, emit) {
      emit(ProductState(products: _products));
    });
    on<ProductEventFavourite>((event, emit) {
      final index = state.products.indexOf(event.productModel);
      state.products[index] = event.productModel.copyWith(
        isFavourite: true,
      );
      emit(ProductState(products: state.products));
    });
    on<ProductEventUnFavourite>((event, emit) {
      final index = state.products.indexOf(event.productModel);
      state.products[index] = event.productModel.copyWith(
        isFavourite: false,
      );
      emit(ProductState(products: state.products));
    });
  }
}
