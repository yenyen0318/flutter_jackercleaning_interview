part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object> get props => [];
}

class AddItemQuantity extends ShopEvent {
  const AddItemQuantity({required this.item});
  final Item item;
}

class RemoveItemQuantity extends ShopEvent {
  const RemoveItemQuantity({required this.item});
  final Item item;
}
