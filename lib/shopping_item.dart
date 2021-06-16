import 'package:hive/hive.dart';

part 'shopping_item.g.dart';

@HiveType(typeId: 1)
class ShoppingItem {
  ShoppingItem(this.name, this.checked);

  @HiveField(0)
  final String name;

  @HiveField(1)
  final bool checked;
}
