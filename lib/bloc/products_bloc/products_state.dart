part of 'product_bloc.dart';

@immutable
abstract class ProductsState {}

abstract class ProductsActionState extends ProductsState {}

final class ProductInitial extends ProductsState {}

class ProductsFetchingSucessfulState extends ProductsState {
  final List<ProductsModel> products;

  ProductsFetchingSucessfulState({
    required this.products,
  });
}
