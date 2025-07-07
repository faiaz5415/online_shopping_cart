import 'dart:io';

Map<String, double> productList = {
  'Laptop': 1200.0,
  'Mobile': 800.0,
  'Mouse': 25.0,
  'Keyboard': 40.0,
};

List<Map<String, dynamic>> cart = [];

void showProductList() {
  print('\n Our Products:');
  productList.forEach((name, price) {
    print('- $name : \$${price}');
  });
}

void addToCart(String productName) {
  if (productList.containsKey(productName)) {
    bool alreadyInCart = false;

    for (var item in cart) {
      if (item['name'] == productName) {
        item['quantity'] += 1;
        alreadyInCart = true;
        print(' $productName quantity increased.');
        break;
      }
    }

    if (!alreadyInCart) {
      cart.add({
        'name': productName,
        'price': productList[productName],
        'quantity': 1
      });
      print(' $productName added to cart.');
    }
  } else {
    print(' Sorry! This product is not in the list.');
  }
}

void showCart() {
  print('\n Your Shopping Cart:');

  if (cart.isEmpty) {
    print(' Your cart is empty!');
    return;
  }

  double total = 0;

  for (var item in cart) {
    double itemTotal = item['price'] * item['quantity'];
    total += itemTotal;

    print('- ${item['name']} × ${item['quantity']} = \$${itemTotal}');
  }

  print(' Total Price: \$${total}');
}

void main() {
  print(' Welcome to the Online Shopping Cart!');

  while (true) {
    showProductList();

    stdout.write('\n Enter product name (type Exit to quit): ');
    String? userInput = stdin.readLineSync();

    if (userInput == null || userInput.toLowerCase() == 'exit') {
      break;
    }

    addToCart(userInput);
  }

  showCart();

  print('\n Thank you for shopping with us!');
}
