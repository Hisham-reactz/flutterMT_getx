import 'package:flutter/material.dart';
import 'package:get_demo/pages/products/domain/entity/product/category.dart';

Row catRow(_cats, _ctrl) {
  return Row(
    children: [
      for (final Category cat in _cats)
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: ActionChip(
            backgroundColor: _ctrl.selectCatId == cat.id
                ? Colors.green.shade400
                : Colors.blueGrey.shade100,
            label: Text(
              cat.name!,
            ),
            onPressed: () {
              _ctrl.setCat(false, cat.id);
            },
          ),
        ),
    ],
  );
}
