import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/products_model.dart';
import 'package:ecommerce/repos/products_repo.dart';
import 'package:meta/meta.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductInitial()) {
    on<ProductsInitialFetchEvent>(productsInitialFetchEvent);
  }

  FutureOr productsInitialFetchEvent(
      ProductsInitialFetchEvent event, Emitter<ProductsState> emit) async {
    List<ProductsModel> products = await ProductsRepository.getProducts();
    emit(ProductsFetchingSucessfulState(products: products));
  }
}
