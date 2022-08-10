part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  final Map<String, Item> cartItems; 
  final String currentClickItem;
  final int max = 10; //最大數量
  final int min = 0; //最小數量
  const ShopState(this.cartItems, this.currentClickItem);
  
  //TODO: 一定要使用Random().nextDouble()??
  //由於會連續emit相同state導致不會重新build，cartItems雖會改變卻不會重新build，故使用Random().nextDouble()強制給予新值
  @override
  List<Object> get props => [Random().nextDouble()];
}

class CartStep extends ShopState {
  const CartStep(Map<String, Item> cartItems, String currentClickItem) : super(cartItems, currentClickItem);
}

class ShopStep extends ShopState {
  const ShopStep(Map<String, Item> cartItems, String currentClickItem) : super(cartItems, currentClickItem);
}

class ChangeQuantity extends ShopState {
  const ChangeQuantity(Map<String, Item> cartItems,String currentClickItem) : super(cartItems, currentClickItem);
}