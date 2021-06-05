import 'package:ecommerce_app/providers/products_provider.dart';
import 'package:ecommerce_app/widgets/category_icon.dart';
import 'package:ecommerce_app/widgets/product_grid_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ProductsProvider>(context, listen: false)
          .getProductsList(),
      builder: (context, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: LayoutBuilder(
                builder: (context, constraints) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.15,
                      child: ListView(
                        children: [
                          CategoryIcon(constraints.maxWidth * 0.2,
                              'Men Clothing', 'assets/images/shoes.svg', () {}),
                          CategoryIcon(
                              constraints.maxWidth * 0.2,
                              'Women Clothing',
                              'assets/images/high-heels.svg',
                              () {}),
                          CategoryIcon(constraints.maxWidth * 0.2,
                              'Electronics', 'assets/images/cpu.svg', () {}),
                          CategoryIcon(constraints.maxWidth * 0.2, 'Jewelery',
                              'assets/images/necklace.svg', () {}),
                        ],
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.8,
                      child: Consumer<ProductsProvider>(
                        builder: (context, value, child) => GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.55),
                          itemCount: value.productsList.length,
                          itemBuilder: (context, index) =>
                              ProductGridTile(value.productsList[index]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
