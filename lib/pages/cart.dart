import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:queue_buster/models/boxes.dart';
import "package:collection/collection.dart";

import 'package:queue_buster/models/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<List<CartItem>> groupedItems = [];

  Future<void> loadData() async {
    List<CartItem> items = boxCartItems.values.toList() as List<CartItem>;

    Map<int, List<CartItem>> grouped = groupBy(items, (ele) => ele.storeId);

    groupedItems.clear();

    grouped.forEach((key, value) {
      groupedItems.add(value);
    });

    setState(() {});
  }

  Future<void> removeItem(int id) async {
    boxCartItems.delete(id);
    await loadData();
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  // List<CartItems> cartitems = [
  //   CartItems(name: 'Gowda Canteen', location: 'BMS College', items: [
  //     Item(name: 'Veg Fried Maggie', price: 40,quantity: 0),
  //     Item(name: 'Kurkure', price: 20,quantity: 0),
  //     Item(name: 'Samosa', price: 20,quantity: 0),
  //     Item(name: 'Paneer Roll', price: 60,quantity: 0)
  //   ]),
  // CartItems(name: 'Just Bake', location: 'BMS College', items: [
  //   Item(itemName: 'Veg Fried Maggie', price: '40'),
  //   Item(itemName: 'Kurkure', price: '20'),
  //   Item(itemName: 'Samosa', price: '20'),
  //   Item(itemName: 'Paneer Roll', price: '60')
  // ]),
  // ];

  // List<CartItems> cartitems = [];
  //
  // void getData() async {
  //   try {
  //     final data = await supabase.from('items').select('name');
  //
  //     for (var elements in data) {
  //       elements.forEach((_, shopName) {
  //         shops.add(Shop(name: shopName, photo: ""));
  //       });
  //
  //       setState(() {});
  //     }
  //   } catch (e) {
  //     debugPrint("Error: $e");
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   getData();
  //
  //   // resData.forEach((element) { })
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 20, bottom: 20),
          //   child: Container(
          //     // color: Colors.lightGreen[500],
          //     height: 60,
          //     width: 280,
          //     decoration: BoxDecoration(
          //       borderRadius: const BorderRadius.all(Radius.elliptical(45, 45)),
          //       color: Colors.lightGreen[500],
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(18.0),
          //       child: Container(
          //         alignment: Alignment.centerRight,
          //         child: const Icon(Icons.search),
          //       ),
          //     ),
          //   ),
          // ),
          // const SearchBarApp(),
          SizedBox(
            height: 60,
            child: Center(
              child: Text(
                'Scroll Horizontally to View your orders ->',
                style: TextStyle(
                    color: Colors.grey[800], fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: groupedItems.isNotEmpty
                ? GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(30),
                    itemCount: groupedItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, mainAxisSpacing: 14),
                    itemBuilder: (BuildContext context, int index) {
                      return groupedItems[index].isNotEmpty ? GridTile(
                        // header: GridTileBar(
                        //   title: Text(cartitems[index].name,
                        //       style: const TextStyle(color: Colors.black)),
                        // ),
                        child: Container(
                          // color: Colors.grey,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(30),
                              bottom: Radius.circular(30),
                            ),
                            color: Colors.lightGreen[500],
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.grey,
                                  spreadRadius: 0,
                                  offset: Offset(2.0, 0.0))
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, left: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.pin_drop),
                                    const SizedBox(width: 4),
                                    Text(
                                        groupedItems[index][0].storeName,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ))
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  'Location : BMSCE',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: groupedItems[index].length,
                                  itemBuilder: (BuildContext context, int i) {
                                    // return Card(
                                    //   child: ListTile(
                                    //     leading: Text(
                                    //         '${groupedItems[index][i].name} - Rs ${groupedItems[index][i].price}'),
                                    //     trailing: TextButton(
                                    //         onPressed: () async {
                                    //           await removeItem(groupedItems[index][i].id);
                                    //         },
                                    //         child: const Icon(Icons.delete)),
                                    //   ),
                                    // );
                                    return Card(
                                        elevation: 2,

                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            // CircleAvatar(
                                            //   backgroundImage: NetworkImage(groupedItems[index].imageUrl!),
                                            //   radius: 40,
                                            // ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${groupedItems[index][i].name} - Price: ${groupedItems[index][i].price}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                // Text(
                                                //   'price - ${items[index].price}',
                                                //   style: const TextStyle(
                                                //       fontSize: 14,
                                                //       fontWeight: FontWeight.normal),
                                                // )
                                              ],
                                            ),
                                            // const SizedBox(
                                            //   width: 80,
                                            // ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                      if (groupedItems[index][i].quantity != 0) {
                                                        CartItem item = boxCartItems.get(groupedItems[index][i].id);

                                                        if(item.quantity == 1) {
                                                          boxCartItems.delete(groupedItems[index][i].id);
                                                        } else {
                                                          item.quantity -= 1;
                                                          boxCartItems.put(groupedItems[index][i].id, item);
                                                        }
                                                      }

                                                      setState(() {
                                                        // if (groupedItems[index][i].quantity != 0) {
                                                        //   groupedItems[index][i].setQuantity(groupedItems[index][i].quantity! - 1);
                                                        //   // groupedItems[index].quantity -= 1;
                                                        // }
                                                      });
                                                    },
                                                    child: const Icon(Icons.remove)),
                                                Text('${groupedItems[index][i].quantity}'),
                                                TextButton(
                                                    onPressed: () {
                                                      // boxCartItems

                                                      if (boxCartItems
                                                          .containsKey(groupedItems[index][i].id)) {
                                                        CartItem item = boxCartItems.get(groupedItems[index][i].id);

                                                        item.quantity += 1;

                                                        boxCartItems.put(groupedItems[index][i].id, item);
                                                      } else {
                                                        boxCartItems.put(
                                                            groupedItems[index][i].id,
                                                            CartItem(
                                                                id: groupedItems[index][i].id,
                                                                name: groupedItems[index][i].name,
                                                                price: groupedItems[index][i].price,
                                                                quantity:
                                                                groupedItems[index][i].quantity + 1,
                                                                storeId: groupedItems[index][i].storeId,
                                                                storeName:
                                                                groupedItems[index][i].storeName));
                                                      }

                                                      setState(() {
                                                        // groupedItems[index][i].setQuantity(groupedItems[index][i].quantity! + 1);
                                                        // groupedItems[index].quantity! += 1;
                                                      });
                                                    },
                                                    child: const Icon(Icons.add)),
                                              ],
                                            )
                                          ],
                                        ));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ) : const Center(
                        child: Text("No Items added"),
                      );
                    },
                  )
                : const Center(
                    child: SpinKitSpinningLines(
                      size: 140,
                      color: Colors.black,
                    ),
                  ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Container(
                height: 40,
                width: 100,
                // margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(0.0, 1.0),
                    ),
                  ],

                  color: Colors.lightGreen[500],
                  // border: Border.all(width: 0.0),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(45, 45)),
                ),
                child: const Center(child: Text('Checkout')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
