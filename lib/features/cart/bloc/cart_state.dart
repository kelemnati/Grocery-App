part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionableState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartedItems;

  CartSuccessState({required this.cartedItems});
}

class CartRemoveActionState extends CartActionableState {}
