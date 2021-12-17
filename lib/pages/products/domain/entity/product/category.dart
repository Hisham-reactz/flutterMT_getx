import 'package:flutter/foundation.dart';

@immutable
class Category {
  final int? id;
  final int? parentId;
  final dynamic offers;
  final String? name;

  const Category({this.id, this.name, this.parentId, this.offers});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        parentId: json['parent_id'] as int?,
        offers: json['offers'] as dynamic,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'parent_id': parentId,
        'offers': offers,
        'name': name,
      };
}
