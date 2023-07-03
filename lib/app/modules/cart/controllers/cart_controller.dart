import 'package:get/get.dart';

import '../../../data/models/products_cart_model.dart';



class CartController extends GetxController {


var productsMap = {}.obs;




void addProductToCart (ProductsCartModel productsCartModel){
if (productsMap.containsKey(productsCartModel)) {
  productsMap[productsCartModel] += 1;
  // productsMap.entries.map((e) => e.key.title).toList();
  print(productsMap);
}else{
  productsMap[productsCartModel] = 1;
  // productsMap.entries.map((e) => e.key.title).toList();

}
}

void removeProductsFromCart(){

}

void removeOneProduct(){

}


void clearAllProduct (){

}



}

