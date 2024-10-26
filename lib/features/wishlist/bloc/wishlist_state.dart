part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

abstract class WishlistStateActionState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistedItems;

  WishlistSuccessState({required this.wishlistedItems});
}

class RemoveWishlistActionState extends WishlistStateActionState {}
