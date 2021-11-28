import 'package:pinto_admin_flutter/model/stock_preview.dart';

class Stock extends StockPreview{
  double customerSales=0;
  double customerProOrder=0;
  List<StockFarm> farmers=[];
  Stock(Map<String,dynamic> jsonStock) : super(jsonStock){
    farmers=(jsonStock['farmers'] as List).map((farm) => StockFarm(farm)).toList();
  }
}

class StockFarm{
  int farmerId=0;
  String farmName='';
  int productId=0;
  double amount=0;

  StockFarm(Map<String,dynamic> jsonStockFarm){
    farmerId=jsonStockFarm['farmer_id'];
    farmName=jsonStockFarm['farm_name'];
    productId=jsonStockFarm['product_id'];
    amount=jsonStockFarm['amount']+0.0;
  }
}