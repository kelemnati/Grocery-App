part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionableState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class NavigateToWishlistState extends HomeActionableState {}

class NavigateToCartState extends HomeActionableState {}

class WishlistedClickedActionState extends HomeActionableState {}

class CartedClickedActionState extends HomeActionableState {}
