part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class InitialWishlist extends WishlistEvent {}

class RemoveWishlistItem extends WishlistEvent {
  final ProductDataModel clickWishlistToRemoveItems;

  RemoveWishlistItem({required this.clickWishlistToRemoveItems});
}
