import 'package:flutter/foundation.dart';

import 'tax.dart';

@immutable
class Price {
  final int? id;
  final int? productId;
  final String? salePrice;
  final int? taxId;
  final Tax? tax;

  const Price({
    this.id,
    this.productId,
    this.salePrice,
    this.taxId,
    this.tax,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        id: json['id'] as int?,
        productId: json['product_id'] as int?,
        salePrice: json['sale_price'].toString(),
        taxId: json['tax_id'] as int?,
        tax: json['tax'] == null
            ? null
            : Tax.fromJson(json['tax'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'sale_price': salePrice,
        'tax_id': taxId,
        'tax': tax?.toJson(),
      };
}
