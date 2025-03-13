import 'package:flutter/material.dart';
import 'item.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CartListWidget(),
        ],
      ),
    );
  }
}


class CartListWidget extends StatefulWidget {
  const CartListWidget({super.key});

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child){
        return cart.itemList.isEmpty
            ? Text('Cart is Empty')
            :ListView.separated(
            itemBuilder: (BuildContext context, int index){
              return CartItem(item: cart.itemList[index]);
            },
            separatorBuilder: (BuildContext context, int index){
              return const Divider();
            },
            itemCount: cart.itemList.length);
      },
    );
  }
}

class CartItem extends StatelessWidget {
  final Item item ;

  const CartItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$item'),
        //('${item.id} : ${item.name}')
        const Expanded(child: SizedBox(),),
        //From this point onward we want to make changes to the app state
        Consumer<CartProvider>(
          builder: (context, cart, child){
            return TextButton(
              onPressed: (){
                //Provider.of<CartProvider>(context,listen: false).remove(item);
                cart.remove(item);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$item removed to cart'),
                    )
                );
              },
              child: Text('Remove'),
            );
          },
        ),


      ],
    );
    return const Placeholder();
  }
}
