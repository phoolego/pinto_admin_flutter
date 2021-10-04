class ProductType {
  String name = '';
  String nameEng = '';
  double priceBuy = 0;
  double priceSell = 0;
  String unit = '';
  String picture = '';

  ProductType(Map<String,dynamic> jsonProductType){
    name = jsonProductType['name'];
    nameEng = jsonProductType['name_eng'];
    priceBuy = jsonProductType['price_buy'];
    priceSell = jsonProductType['price_sell'];
    unit = jsonProductType['unit'];
    picture = jsonProductType['picture_of_product'];
  }
}