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
          title: const Text('E-Commerce App'),
        ),
        body: BlocConsumer<ProductsBloc, ProductsState>(
          bloc: productsBloc,
          listenWhen: (previous, current) => current is ProductsActionState,
          buildWhen: (previous, current) => current is! ProductsActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case ProductsFetchingSucessfulState:
                final sucessState = state as ProductsFetchingSucessfulState;
                return ListView.builder(
                  itemCount: sucessState.products.length,
                  itemBuilder: (context, index) {
                    return Material(
                        color: const Color.fromARGB(255, 234, 234, 234),
                        child: ListTile(
                          onTap: () {
                            setState(() {});
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(state.products[index].image,
                                  width: 80, height: 80),
                              const SizedBox(height: 10),
                              Text(state.products[index].category),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$${state.products[index].price.toString()}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 4, 4, 4),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'rate: ${state.products[index].rating.rate.toString()}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 77, 77, 77),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          dense: false,
                        ));
                  },
                );
            }
            return Container();
          },
        ));
  }
}
