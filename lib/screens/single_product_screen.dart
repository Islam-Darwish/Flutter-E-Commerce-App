import 'dart:ui';

import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProductScreen extends StatelessWidget {
  SingleProductScreen(this.initProduct);

  final Product initProduct;
  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        itemCount: productsProvider.productsList.length,
        controller: PageController(
          initialPage: productsProvider.getProductIndex(initProduct),
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(
            builder: (context, constraints) => Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * 0.5,
                            child: Hero(
                              tag: 'photo${productsProvider.productsList[index].id}',
                              child: Image.network(
                                productsProvider.productsList[index].image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            productsProvider.productsList[index].title,
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(productsProvider.productsList[index].category),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '\$${productsProvider.productsList[index].price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              productsProvider.productsList[index].description),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: constraints.maxWidth * 0.7,
                      height: constraints.maxHeight * 0.08,
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
