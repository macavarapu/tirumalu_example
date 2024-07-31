import 'package:flutter/material.dart';

import 'product_viewmodel.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int? productId;
  const ProductDetailsScreen({super.key, this.productId});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductViewModel>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(179, 205, 200, 200),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: FutureBuilder(
        future: provider.productsDetail(productId),
        builder: (context, snapshot) {
          final product = provider.productDetails;
          if (snapshot.connectionState == ConnectionState.waiting) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        product?.images?.length ?? 0,
                        (index) => Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 5, right: 10),
                              child: Image.network(
                                provider.productDetails?.images![index] ?? '',
                                width: 100,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ))
                  ],
                ),
              ),
              _textColumn('Title : ', product?.title ?? ''),
              _textColumn('Price : ', '${product?.price ?? ''}'),
              _textColumn('Discount : ', '${product?.discountPercentage ?? ''}%'),
              _textColumn('Rating : ', '${product?.rating ?? ''}'),
              _textColumn('Stoke : ', '${product?.stock ?? ''}'),
              _textColumn('Brand : ', product?.brand ?? ''),
              _textColumn('Category : ', product?.category ?? ''),
              _textColumn('Description : ', product?.description ?? ''),
            ],
          );
        },
      ),
    );
  }

  Padding _textColumn(String title,String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(text: TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                text: data,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
              )
            ]
          ))
        ],
      ),
    );
  }
}
