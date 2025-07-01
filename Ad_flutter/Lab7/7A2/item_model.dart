import 'package:get/get.dart';

class ItemModel {
  final String name;
  RxBool isFavorite;

  ItemModel({required this.name, bool isFavorite = false})
      : isFavorite = isFavorite.obs;
}
