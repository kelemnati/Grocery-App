import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:understanding_bloc/data/wishlist_data.dart';
import 'package:understanding_bloc/features/home/models/home_product_data_model.dart';
import 'package:understanding_bloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:understanding_bloc/features/wishlist/ui/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    super.initState();
    wishlistBloc.add(InitialWishlist());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favourite Items"),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listenWhen: (previous, current) =>
              current is WishlistStateActionState,
          buildWhen: (previous, current) =>
              current is! WishlistStateActionState,
          listener: (context, state) {
            if (state is RemoveWishlistActionState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text("Item removed from favourites")));
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistSuccessState:
                final successState = state as WishlistSuccessState;
                return ListView.builder(
                  itemCount: successState.wishlistedItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                      productDataModel: successState.wishlistedItems[index],
                      wishlistBloc: wishlistBloc,
                    );
                  },
                );
                break;
              default:
                return SizedBox();
            }
          },
        ));
  }
}
