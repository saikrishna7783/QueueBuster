import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:queue_buster/models/boxes.dart';
import 'package:queue_buster/models/cart_item.dart';

import '../constants/cart_items.dart';
import '../main.dart';

class MenuPage extends StatefulWidget {
  final int storeId;

  const MenuPage({super.key, required this.storeId});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Item> items = [];

  // List<Item> items = [
  //
  // Item(itemName: 'Veg Fried Maggie', price: '40'),
  // Item(itemName: 'Kurkure', price: '20'),
  // Item(itemName: 'Samosa', price: '20'),
  // Item(itemName: 'Paneer Roll', price: '60'),
  //
  // ];

  void getData() async {
    try {
      final data = await supabase
          .from('items')
          .select('id,name,price,store_id,stores(image_url,name),image_url')
          .eq('store_id', widget.storeId);

      for (var elements in data) {
        items.add(Item(
            id: elements["id"],
            name: elements["name"],
            price: elements["price"],
            storeId: elements["store_id"],
            storeName: elements["stores"]["name"],
            storeImageUrl: elements["stores"]["image_url"],
            imageUrl: elements["image_url"],
            quantity: 0));
        setState(() {});
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    debugPrint("${widget.storeId}");
    getData();

    // resData.forEach((element) { })
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                // bottom: Radius.circular(30),
                top: Radius.zero,
              ),
              color: Colors.lightGreen[400],
              boxShadow: const [
                BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey,
                    spreadRadius: 2,
                    offset: Offset(2.0, 0.0))
              ],
            ),
            child: Column(children: [
              Center(
                child: Text(
                  items[0].storeName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(items[0].storeImageUrl!),
                  radius: 60,
                ),
              )
            ]),
          ),
        ),
        const Divider(
          height: 3,
        ),
        // const Expanded(
        //   flex: 1,
        //     child: Text('Food Items Available -')),

        // SizedBox(height: 20,),
        Expanded(
          flex: 3,
          child: items.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 150,
                      child: Card(
                          elevation: 2,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(items[index].imageUrl!),
                                radius: 40,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    items[index].name!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'price - ${items[index].price}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  )
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
                                        if (items[index].quantity != 0) {
                                          CartItem item = boxCartItems.get(items[index].id);

                                          if(item.quantity == 1) {
                                            boxCartItems.delete(items[index].id);
                                          } else {
                                            item.quantity -= 1;
                                            boxCartItems.put(items[index].id, item);
                                          }
                                        }

                                        setState(() {
                                          if (items[index].quantity != 0) {
                                            items[index].setQuantity(items[index].quantity! - 1);
                                            // items[index].quantity -= 1;
                                          }
                                        });
                                      },
                                      child: const Icon(Icons.remove)),
                                  Text('${items[index].quantity}'),
                                  TextButton(
                                      onPressed: () {
                                        // boxCartItems

                                        if (boxCartItems
                                            .containsKey(items[index].id)) {
                                          CartItem item = boxCartItems.get(items[index].id);

                                          item.quantity += 1;

                                          boxCartItems.put(items[index].id, item);
                                        } else {
                                          boxCartItems.put(
                                              items[index].id,
                                              CartItem(
                                                  id: items[index].id!,
                                                  name: items[index].name!,
                                                  price: items[index].price!,
                                                  quantity:
                                                      items[index].quantity! + 1,
                                                  storeId: items[index].storeId!,
                                                  storeName:
                                                      items[index].storeName!));
                                        }

                                        setState(() {
                                          items[index].setQuantity(items[index].quantity! + 1);
                                          // items[index].quantity! += 1;
                                        });
                                      },
                                      child: const Icon(Icons.add)),
                                ],
                              )
                            ],
                          )),
                    );
                  },
                )
              : const Center(
                  child: SpinKitSpinningLines(
                    size: 140,
                    color: Colors.black,
                  ),
                ),
        )
      ],
    ));
  }
}

//
// class CustomListItem extends StatelessWidget {
//   const CustomListItem({
//     super.key,
//     required this.thumbnail,
//     required this.title,
//     required this.user,
//     required this.viewCount,
//   });
//
//   final Widget thumbnail;
//   final String title;
//   final String user;
//   final int viewCount;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             flex: 2,
//             child: thumbnail,
//           ),
//           Expanded(
//             flex: 3,
//             child: _VideoDescription(
//               title: title,
//               user: user,
//               viewCount: viewCount,
//             ),
//           ),
//           const Icon(
//             Icons.more_vert,
//             size: 16.0,
//           ),
//         ],
//       ),
//     );
//   }
// }
