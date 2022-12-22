import "package:hive/hive.dart";

part 'goods_model.g.dart';

@HiveType(typeId: 1)
class Goods {
  @HiveField(0)
  late final String name;
  @HiveField(1)
  late final String description;
  Goods({
    required this.name,
    required this.description,
  });
}
