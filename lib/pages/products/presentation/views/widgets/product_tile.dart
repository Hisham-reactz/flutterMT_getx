import 'package:flutter/material.dart';
import 'package:get_demo/pages/products/domain/entity/product/product.dart';

ListTile productTile(Product product) {
  final imgUrl = product.offers == null
      ? product.images!.first['image_url']
      : product.offers!.priceBook!.file;
  double perc(loaded, total) => (loaded * 100) / total;

  return ListTile(
    isThreeLine: true,
    leading: Image.network(
      'https://sta.farawlah.sa/storage/$imgUrl',
      width: 100,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator(
          value: perc(
                loadingProgress.cumulativeBytesLoaded,
                loadingProgress.expectedTotalBytes,
              ) *
              0.01,
        );
      },
    ),
    minLeadingWidth: 0.0,
    title: Text(
      '${product.name}',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle: Text(
      '${product.price!.salePrice} SAR',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.green.shade400,
      ),
    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.favorite_rounded,
          color: Colors.red.shade900,
        ),
        Icon(
          Icons.add_circle,
          color: Colors.green.shade400,
        ),
      ],
    ),
  );
}
