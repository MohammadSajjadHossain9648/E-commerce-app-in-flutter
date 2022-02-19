import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';
import '../models/cart.dart';
import '../models/order.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 30.0,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      body: Column(
        children: [
          //without epanded flatbutton not going to show
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartPdt(
                      cart.items.values.toList()[i].id,
                      cart.items.keys.toList()[i],
                      cart.items.values.toList()[i].price,
                      cart.items.values.toList()[i].name,
                      cart.items.values.toList()[i].quantity,
                    )),
          ),
          CheckOutButton(cart: cart),
        ],
      ),
    );
  }
}

class CheckOutButton extends StatefulWidget {
  final Cart cart;
  const CheckOutButton({@required this.cart});
  @override
  _CheckOutButtonState createState() => _CheckOutButtonState();
}

class _CheckOutButtonState extends State<CheckOutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'CheckOut',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0,
        ),
      ),
      onPressed: widget.cart.totalAmount <= 0
          ? null
          : () async {
              await Provider.of<Orders>(context, listen: false).addOrders(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount,
              );
              widget.cart
                  .clear(); // after click the checkout button all list are clear
            },
    );
  }
}
