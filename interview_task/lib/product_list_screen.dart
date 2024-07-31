import 'package:flutter/material.dart';

import 'product_details_screen.dart';
import 'product_viewmodel.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(179, 211, 208, 208),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Products',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, provider, child) {
          if (provider.productsList.isEmpty) {
            provider.products();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.productsList.length,
              itemBuilder: (context, index) {
                final obj = provider.productsList[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(productId: obj.id),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            obj.thumbnail ?? '',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text(
                              obj.title ?? '',
                              style: TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('₹${obj.price ?? ''}',style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15
                                ),),
                                Text('${obj.brand}',style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15
                                )),
                                Text('discount ${obj.discountPercentage}%',style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15
                                ))
                              ],
                            ),
                          ),
                          SizedBox(height: 5,)
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
