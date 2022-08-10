import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/item.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  static Map<String, Item> cartItems = {};

  ShopBloc() : super(const NotAllowNextStep({}, '')) {
    //依據各event事件加入商業邏輯
    on<AddItemQuantity>(_onAddItemQuantity);
    on<RemoveItemQuantity>(_onRemoveItemQuantity);
  }

  void _onAddItemQuantity(AddItemQuantity event, Emitter<ShopState> emit) {
    if (cartItems.containsKey(event.item.title)) {
      cartItems[event.item.title]!.quantity++;
      if (cartItems[event.item.title]!.quantity >= state.max) {
        cartItems[event.item.title]!.quantity = state.max;
      }
    } else {
      cartItems[event.item.title] = event.item;
      cartItems[event.item.title]!.quantity++;
    }
    emit(ChangeQuantity(cartItems, event.item.title));
    emit(
      cartItems.length == 1
          ? AllowNextStep(cartItems, event.item.title)
          : NotAllowNextStep(cartItems, event.item.title),
    );
  }

  void _onRemoveItemQuantity(
      RemoveItemQuantity event, Emitter<ShopState> emit) {
    if (cartItems.containsKey(event.item.title)) {
      cartItems[event.item.title]!.quantity--;
      if (cartItems[event.item.title]!.quantity <= state.min) {
        cartItems.remove(event.item.title);
      }
    }
    emit(ChangeQuantity(cartItems, event.item.title));
    emit(
      cartItems.length == 1
          ? AllowNextStep(cartItems, event.item.title)
          : NotAllowNextStep(cartItems, event.item.title),
    );
  }
}
