import 'package:flutter/material.dart';
import 'package:fluttershopping/shopping_list_item.dart';
import 'package:fluttershopping/models/product.dart';

void main() => runApp(MaterialApp(
  title: 'Shopping App',
  home: ShoppingList(
    products: <Product>[
      Product(name: 'Eggs'),
      Product(name: 'Flour'),
      Product(name: 'Chocolate chips'),
    ],
  ),
));

class ShoppingList extends StatefulWidget {

  final List<Product> products;
  @override
  _ShoppingListState createState() => _ShoppingListState();

  ShoppingList({Key key, this.products}) : super(key:key);
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: ListView(
        children: widget.products.map((Product product) {
          return ShoppingListItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onCartChanged: _handleCartChanged
          );
        }).toList(),
      ),
    );
  }
}

