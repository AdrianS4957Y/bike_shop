import 'package:intl/intl.dart';

class Bike {
  late String src;
  late String name;
  late num price;
  late String formattedPrice;
  late String description;
  late String specification;
  Bike(this.src, this.name, this.price, {description, specification}) {
    if (price is double) {
      formattedPrice =
          NumberFormat.currency(locale: 'en_US', symbol: '\$ ').format(price);
    } else {
      formattedPrice = "\$ $price";
    }
    this.description = description ?? "not descripted yet";
    this.specification = specification ?? "not special";
  }
}
