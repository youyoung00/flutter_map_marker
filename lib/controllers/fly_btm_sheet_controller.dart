import 'package:flutter/material.dart';

enum SheetState { basic, invisible, full }

class FlyBtmSheetController extends ChangeNotifier {
  SheetState sheetState = SheetState.basic;

  // List<ProductItem> cart = [];

  void changeSheetState(SheetState state) {
    sheetState = state;
    notifyListeners();
  }

// void addProductToCart(Product product) {
//   for (ProductItem item in cart) {
//     if (item.product!.title == product.title) {
//       item.increment();
//       notifyListeners();
//       return;
//     }
//   }
//   cart.add(ProductItem(product: product));
//   notifyListeners();
// }

//   int totalCartItems() => cart.fold(
//       0, (previousValue, element) => previousValue + element.quantity);
// }
}
