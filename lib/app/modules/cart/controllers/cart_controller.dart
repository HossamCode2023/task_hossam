// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:task_hossam/app/services/settingServices.dart';

import '../../../data/models/products_cart_model.dart';



class CartController extends GetxController {


var productsMap = {}.obs;




void addProductToCart (Product productModel){
if (productsMap.containsKey(productModel)) {
  productsMap[productModel] += 1;
  print(productsMap.entries.map((e) => e.key.title  ).toList());
  print(productsMap.length.toString());
  myBox!.put('basketCount', productsMap.length.toString());
}else{
  productsMap[productModel] = 1;
  print(productsMap.entries.map((e) => e.key.title ).toList());
  print(productsMap.length .toString());
    myBox!.put('basketCount', productsMap.length.toString());


}
}

void removeProductsFromCart(Product productModel){
if (productsMap.containsKey(productModel) && productsMap[productModel] == 1) {

productsMap.removeWhere((key, value) => key == productModel);
  print(productsMap.length.toString());

}else{
  productsMap[productModel] -=1;
    print(productsMap.length.toString());

}
}

void removeOneProduct(Product productModel){
productsMap.removeWhere((key, value) => key == productModel);
}


void clearAllProduct (){
productsMap.clear();
}

get productTitle => productsMap.entries.map((e) => e.key.title  ).toList();
get productCategory => productsMap.entries.map((e) => e.key.category  ).toList();
get productThumbnail => productsMap.entries.map((e) => e.key.thumbnail  ).toList();

}

