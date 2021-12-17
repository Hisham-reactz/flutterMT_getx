import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_demo/pages/products/presentation/controllers/product_controller.dart';
import 'package:get_demo/pages/products/presentation/views/category_view.dart';
import 'package:get_demo/pages/products/presentation/views/widgets/product_tile.dart';

class ProductsView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.red.shade900,
        ),
        title: Icon(
          Icons.shop_2_rounded,
          color: Colors.red.shade900,
        ),
        actions: [
          Icon(
            Icons.search_rounded,
            color: Colors.red.shade900,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        elevation: 0.5,
        centerTitle: true,
        bottom: PreferredSize(
          child: CategoryView(),
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            115,
          ),
        ),
      ),
      body: Center(
        child: controller.obx(
          (state) {
            return ListView.separated(
              controller: controller.sctrl,
              itemBuilder: (context, index) {
                final product = state![index];
                //product listtile
                return productTile(product);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: state!.length,
            );
          },
        ),
      ),
    );
  }
}
