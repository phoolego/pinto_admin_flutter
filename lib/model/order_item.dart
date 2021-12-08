class OrderItem {
  int orderItemId = 0;
  double amount = 0.0;
  String unit = '';
  double price = 0.0;
  int orderId = 0;
  String productType = '';
  int? ppoId;
  String? picUrl;

  OrderItem(Map<String, dynamic> jsonOrderItem) {
    orderItemId = jsonOrderItem['order_item_id'] + 0;
    amount = jsonOrderItem['amount'] + 0.0;
    unit = jsonOrderItem['unit'];
    price = jsonOrderItem['price'] + 0.0;
    orderId = jsonOrderItem['order_id'] + 0;
    productType = jsonOrderItem['type_of_product'];
    ppoId = jsonOrderItem['ppo_id'];
  }
  OrderItem.basket(this.amount, this.price, this.productType, this.unit, this.picUrl){
    orderItemId = 0;
    orderId = 0;
  }
  Map<String,dynamic> getMap(){
    return {
      'order_item_id': orderItemId,
      'amount':amount,
      'unit':unit,
      'price':price,
      'type_of_product':productType,
      'ppo_id':ppoId
    };
  }
}
