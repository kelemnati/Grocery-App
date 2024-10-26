import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:understanding_bloc/data/wishlist_data.dart';
import 'package:understanding_bloc/features/home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<InitialWishlist>(initialWishlist);
    on<RemoveWishlistItem>(removeWishlistItem);
  }

  FutureOr<void> initialWishlist(
      InitialWishlist event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistedItems: clickedWishlistData));
  }

  FutureOr<void> removeWishlistItem(
      RemoveWishlistItem event, Emitter<WishlistState> emit) {
    print("Remove Wishlist Items");
    clickedWishlistData.remove(event.clickWishlistToRemoveItems);
    emit(WishlistSuccessState(wishlistedItems: clickedWishlistData));
    emit(RemoveWishlistActionState());
  }
}
