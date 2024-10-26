import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:understanding_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:understanding_bloc/features/cart/ui/cart_tile_widget.dart';
import 'package:understanding_bloc/features/wishlist/bloc/wishlist_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartBloc cartBloc = CartBloc();

  void initState() {
    super.initState();
    cartBloc.add(InitialCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionableState,
        buildWhen: (previous, current) => current is! CartActionableState,
        listener: (context, state) {
          if (state is RemoveWishlistActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: const Text("Item removed from Cart")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartedItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                    productDataModel: successState.cartedItems[index],
                    cartBloc: cartBloc,
                  );
                },
              );
              break;
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
