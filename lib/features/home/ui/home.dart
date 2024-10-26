import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:understanding_bloc/features/cart/ui/cart.dart';
import 'package:understanding_bloc/features/home/bloc/home_bloc.dart';
import 'package:understanding_bloc/features/home/ui/product_tile_widget.dart';
import 'package:understanding_bloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(IntialHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionableState,
      buildWhen: (previous, current) => current is! HomeActionableState,
      bloc: homeBloc,
      listener: (context, state) {
        if (state is NavigateToWishlistState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is NavigateToCartState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is WishlistedClickedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item added to Wishlisted")));
        } else if (state is CartedClickedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item added to Cart")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;

          case HomeSuccessState:
            final successState = state as HomeSuccessState;
            return Scaffold(
              appBar: AppBar(
                elevation: 4,
                // centerTitle: true,
                title: const Text("Grocery App"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(WishlistNavigateButtonClicked());
                      },
                      icon: Icon(Icons.favorite_border_outlined)),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(CartNavigateButtonClicked());
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
                  )
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                      homeBloc: homeBloc,
                      productDataModel: successState.products[index]);
                },
              ),
            );
            break;

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error Message"),
              ),
            );
            break;
          default:
            return Scaffold(
              body: SizedBox(),
            );
        }
      },
    );
  }
}
