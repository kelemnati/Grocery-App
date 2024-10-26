part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class InitialCartEvent extends CartEvent {}

class RemoveCartItems extends CartEvent {
  final ProductDataModel clickedToRemoveCartItems;

  RemoveCartItems({required this.clickedToRemoveCartItems});
}
