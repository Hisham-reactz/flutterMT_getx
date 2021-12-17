import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_demo/pages/products/presentation/controllers/category_controller.dart';
import 'package:get_demo/pages/products/presentation/views/widgets/cat_row.dart';
import 'package:get_demo/pages/products/presentation/views/widgets/sub_cat_row.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.grid_on,
                color: Colors.red.shade900,
              ),
              minLeadingWidth: 0.0,
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                //scrollable category widget
                child: catRow(
                  state,
                  controller,
                ),
              ),
            ),
            ListTile(
              minLeadingWidth: 0.0,
              leading: Icon(
                Icons.filter_alt,
                color: Colors.red.shade900,
              ),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                //scrollable sub category widget
                child: subcatRow(
                  controller,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
