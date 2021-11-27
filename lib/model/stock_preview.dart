class StockPreview {
  String name = '';
  String nameEng = '';
  double sellingAmount = 0;
  double preorderAmount = 0;
  String unit = '';
  String? pic;

  StockPreview(Map<String,dynamic> jsonStockPreview){
    name = jsonStockPreview['name'];
    nameEng = jsonStockPreview['name_eng'];
    sellingAmount = jsonStockPreview['selling_amount']+0.0;
    preorderAmount = jsonStockPreview['preorder_amount']+0.0;
    unit = jsonStockPreview['unit'];
    pic = jsonStockPreview['picture_of_product'];
  }
}