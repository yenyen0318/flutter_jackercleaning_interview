part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  final Map<String, Item> cartItems; 
  final String currentClickItem;
  final int max = 10; //最大數量
  final int min = 0; //最小數量
  const ShopState(this.cartItems, this.currentClickItem);
  
  @override
  List<Object> get props => [];
}

class AllowNextStep extends ShopState {
  const AllowNextStep(Map<String, Item> cartItems, String currentClickItem) : super(cartItems, currentClickItem);
}

class NotAllowNextStep extends ShopState {
  const NotAllowNextStep(Map<String, Item> cartItems, String currentClickItem) : super(cartItems, currentClickItem);
}

class ChangeQuantity extends ShopState {
  const ChangeQuantity(Map<String, Item> cartItems,String currentClickItem) : super(cartItems, currentClickItem);
}