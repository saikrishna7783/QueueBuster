import "package:hive/hive.dart";

part "cart_item.g.dart";

@HiveType(typeId: 0)
class CartItem {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int price;

  @HiveField(3)
  late int quantity;

  @HiveField(4)
  final int storeId;

  @HiveField(5)
  final String storeName;

  void setQuantity(int newVal) {
    quantity = newVal;
  }

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.storeId,
    required this.storeName,
  });
}
