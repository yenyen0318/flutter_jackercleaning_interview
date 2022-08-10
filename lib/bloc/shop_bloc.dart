import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/item.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  static Map<String, Item> cartItems = {};

  ShopBloc() : super(const ShopStep({}, '')) {
    //依據各event事件加入商業邏輯
    on<Initial>(_onInitial);
    on<AddItemQuantity>(_onAddItemQuantity);
    on<RemoveItemQuantity>(_onRemoveItemQuantity);
  }

  void _onInitial(Initial event, Emitter<ShopState> emit) {
    cartItems = {};
  }

  void _onAddItemQuantity(AddItemQuantity event, Emitter<ShopState> emit) {
    bool isAddItem = false;
    if (cartItems.containsKey(event.item.title)) {
      cartItems[event.item.title]!.quantity++;
      if (cartItems[event.item.title]!.quantity > state.max) {
        cartItems[event.item.title]!.quantity = state.max;
      }
    } else {
      cartItems[event.item.title] = event.item;
      cartItems[event.item.title]!.quantity++;
      isAddItem = true;
    }
    emit(ChangeQuantity(cartItems, event.item.title));

    if (isAddItem) {
      emit(
        cartItems.length == 1
            ? CartStep(cartItems, event.item.title)
            : ShopStep(cartItems, event.item.title),
      );
    }
  }

  void _onRemoveItemQuantity(
      RemoveItemQuantity event, Emitter<ShopState> emit) {
    bool isRemoveItem = false;
    if (cartItems.containsKey(event.item.title)) {
      cartItems[event.item.title]!.quantity--;
      if (cartItems[event.item.title]!.quantity <= state.min) {
        cartItems.remove(event.item.title);
        isRemoveItem = true;
      }
    }

    emit(ChangeQuantity(cartItems, event.item.title));

    if (isRemoveItem) {
      emit(
        cartItems.length == 1
            ? CartStep(cartItems, event.item.title)
            : ShopStep(cartItems, event.item.title),
      );
    }
  }
}
