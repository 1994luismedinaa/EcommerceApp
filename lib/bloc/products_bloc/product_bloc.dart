import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/products_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductInitial()) {
    on<ProductsInitialFetchEvent>(productsInitialFetchEvent);
  }

  FutureOr productsInitialFetchEvent(
      ProductsInitialFetchEvent event, Emitter<ProductsState> emit) async {
    final client = http.Client();
    List<ProductsModel> products = [];
    try {
      final response =
          await client.get(Uri.parse('https://fakestoreapi.com/products'));
      List result = jsonDecode(response.body);
      result
          .map((product) => products.add(ProductsModel.fromMap(product)))
          .toList();
      emit(ProductsFetchingSucessfulState(products: products));
    } catch (e) {
      print(e.toString());
    }
  }
}
