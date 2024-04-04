import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final bool isFavourite;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.isFavourite = false,
  });

  ProductModel copyWith({
    bool? isFavourite,
  }) {
    return ProductModel(
      id: id,
      name: name,
      price: price,
      imageUrl: imageUrl,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  List<Object?> get props => [id];
}
