import 'package:ecommerce/bloc/products_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _ProductsState();
}

class _ProductsState extends State<HomePage> {
  final ProductsBloc productsBloc = ProductsBloc();

  @override
  void initState() {
    productsBloc.add(ProductsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('E-Commerce App'),
        ),
        body: BlocConsumer<ProductsBloc, ProductsState>(
          bloc: productsBloc,
          listenWhen: (previous, current) => current is ProductsActionState,
          buildWhen: (previous, current) => current is! ProductsActionState,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case ProductsFetchingSucessfulState:
                final sucessState = state as ProductsFetchingSucessfulState;
                return ListView.builder(
                  itemCount: sucessState.products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: [
                          Image.network(state.products[index].image,
                              width: 80, height: 80),
                          Text(state.products[index].category),
                        ],
                      ),
                    );
                  },
                );
            }
            return Container();
          },
        ));
  }
}
