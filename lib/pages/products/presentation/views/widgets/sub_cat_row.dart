import 'package:flutter/material.dart';
import 'package:get_demo/pages/products/domain/entity/product/category.dart';

Row subcatRow(
  _ctrl,
) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      for (final Category subcat in _ctrl.subCats)
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: ActionChip(
            backgroundColor: _ctrl.selectSubcatId == subcat.id
                ? Colors.green.shade400
                : Colors.blueGrey.shade100,
            label: Text(
              subcat.name!,
            ),
            onPressed: () {
              _ctrl.setCat(true, subcat.id);
            },
          ),
        ),
    ],
  );
}
