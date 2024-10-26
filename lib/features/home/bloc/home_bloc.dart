import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:understanding_bloc/data/cart_data.dart';
import 'package:understanding_bloc/data/grocery_data.dart';
import 'package:understanding_bloc/data/wishlist_data.dart';
import 'package:understanding_bloc/features/home/models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<IntialHomeEvent>(intialHomeEvent);
    on<WishlistButtonClicked>(wishlistButtonClicked);
    on<CartButtonClicked>(cartButtonClicked);
    on<WishlistNavigateButtonClicked>(wishlistNavigateButtonClicked);
    on<CartNavigateButtonClicked>(cartNavigateButtonClicked);
  }

  FutureOr<void> wishlistButtonClicked(
      WishlistButtonClicked event, Emitter<HomeState> emit) {
    print("Wishlist Clicked");
    clickedWishlistData.add(event.clickedItems);
    emit(WishlistedClickedActionState());
  }

  FutureOr<void> cartButtonClicked(
      CartButtonClicked event, Emitter<HomeState> emit) {
    print("Cart Button Clicked");
    clickedCartItems.add(event.clickedItems);
    emit(CartedClickedActionState());
  }

  FutureOr<void> wishlistNavigateButtonClicked(
      WishlistNavigateButtonClicked event, Emitter<HomeState> emit) {
    print("Navigate to Wishlist");
    emit(NavigateToWishlistState());
  }

  FutureOr<void> cartNavigateButtonClicked(
      CartNavigateButtonClicked event, Emitter<HomeState> emit) {
    print("Navigate to Cart");
    emit(NavigateToCartState());
  }

  FutureOr<void> intialHomeEvent(
      IntialHomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    // Mapping grocery products to ProductDataModel with unique IDs
    emit(HomeSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                category: e['category'],
                price: e['price'],
                quantity: e['quantity'],
                image: e['image'],
                description: e["description"]))
            .toList()));
  }
}
