import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:understanding_bloc/data/cart_data.dart';
import 'package:understanding_bloc/features/home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<InitialCartEvent>(initialCartEvent);
    on<RemoveCartItems>(removeCartItems);
  }

  FutureOr<void> initialCartEvent(
      InitialCartEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartedItems: clickedCartItems));
  }

  FutureOr<void> removeCartItems(
      RemoveCartItems event, Emitter<CartState> emit) {
    print("Remove Cart Item");
    clickedCartItems.remove(event.clickedToRemoveCartItems);
    emit(CartSuccessState(cartedItems: clickedCartItems));
    emit(CartRemoveActionState());
  }
}
