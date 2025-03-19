import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ShoppingList());
  }
}

class ShoppingList extends StatefulWidget {
  @override
  ShoppingListState createState() => ShoppingListState();
}

class ShoppingListState extends State<ShoppingList> {
  final List<String> itemsToAdd = [];
  final TextEditingController itemCountroller = TextEditingController();
  void addItem() {
    setState(() {
      if (itemCountroller.text.isNotEmpty) {
        itemsToAdd.add(itemCountroller.text);
        itemCountroller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping list',
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: itemCountroller,
                    decoration: InputDecoration(hintText: 'Enter an item'),
                  ),
                ),
                IconButton(onPressed: addItem, icon: Icon(Icons.add)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemsToAdd.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(itemsToAdd[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
