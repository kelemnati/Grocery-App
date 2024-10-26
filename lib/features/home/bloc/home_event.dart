part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class IntialHomeEvent extends HomeEvent {}

class WishlistButtonClicked extends HomeEvent {
  final ProductDataModel clickedItems;

  WishlistButtonClicked({required this.clickedItems});
}

class CartButtonClicked extends HomeEvent {
  final ProductDataModel clickedItems;

  CartButtonClicked({required this.clickedItems});
}

class WishlistNavigateButtonClicked extends HomeEvent {}

class CartNavigateButtonClicked extends HomeEvent {}
