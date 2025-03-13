import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/cart.dart';
import 'package:shopping/cart_provider.dart';
import 'item.dart';
void main() {
  runApp(
      ChangeNotifierProvider(
        //attach a state manager to this app
          create: (context) => CartProvider(),
          child: const MyApp(),
      )
  );
}

final List<Item> catalog = [
  Item(1, 'Shoes'),
  Item(2, 'Hats'),
  Item(3, 'Shirts'),
  Item(4, 'Tie'),
  Item(5, 'Pants'),
  Item(6, 'Jeans'),
  Item(7, 'Shorts'),
  Item(8, 'Underwear'),
  Item(9, 'Jumpers'),
  Item(10, 'Trousers'),
  Item(11, 'Sleepwear'),
  Item(12, 'Accessories'),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CartPage()
                  )
                );
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Center(
        child:  ListView.separated(
            itemBuilder: (BuildContext context, int index){
              return CartItem(index: index);
            },
            separatorBuilder: (BuildContext context, int index){
              return const Divider();
      },
            itemCount: catalog.length,
          padding: const EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}


class CartItem extends StatelessWidget {
  final int index;

  const CartItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    var item = catalog[index];

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
                cart.add(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$item added to cart'),
                  )
                );
              },
              child: Text('Add'),
            );
          },
        ),


      ],
    );
    return const Placeholder();
  }
}

