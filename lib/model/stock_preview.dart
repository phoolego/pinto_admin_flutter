class StockPreview {
  String name = '';
  String nameEng = '';
  double sellingAmount = 0;
  double preorderAmount = 0;
  String Unit = '';

  StockPreview(Map<String,dynamic> jsonStockPreview){
    name = jsonStockPreview['name'];
    nameEng = jsonStockPreview['name_eng'];
    sellingAmount = jsonStockPreview['selling_amount']+0.0;
    preorderAmount = jsonStockPreview['preorder_amount']+0.0;
    Unit = jsonStockPreview['unit'];
  }
}