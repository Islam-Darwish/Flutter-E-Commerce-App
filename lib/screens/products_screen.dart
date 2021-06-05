import 'package:ecommerce_app/providers/products_provider.dart';
import 'package:ecommerce_app/screens/single_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                          getCategoryButton(constraints, 'Men Clothing',
                              'assets/images/shoes.svg', () {}),
                          getCategoryButton(constraints, 'Women Clothing',
                              'assets/images/high-heels.svg', () {}),
                          getCategoryButton(constraints, 'Electronics',
                              'assets/images/cpu.svg', () {}),
                          getCategoryButton(constraints, 'Jewelery',
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
                          itemBuilder: (context, index) => GridTile(
                            child: InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SingleProductScreen(
                                    value.productsList[index]),
                              )),
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Hero(
                                          tag:
                                              'photo${value.productsList[index].id}',
                                          child: Image.network(
                                            value.productsList[index].image,
                                            fit: BoxFit.contain,
                                            width: constraints.maxWidth,
                                            height: constraints.maxWidth * 1.5,
                                          ),
                                        ),
                                        Text(
                                          value.productsList[index].title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          value.productsList[index].category,
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .color!
                                                  .withOpacity(0.5)),
                                        ),
                                        Text(
                                          '\$' +
                                              value.productsList[index].price
                                                  .toString(),
                                          style: TextStyle(
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget getCategoryButton(BoxConstraints constraints, String title,
      String assetPath, Function ontap) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: constraints.maxHeight * 0.15,
      height: constraints.maxHeight * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: constraints.maxHeight * 0.12,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: constraints.maxHeight * 0.1,
                  backgroundColor: Colors.black.withOpacity(0.05),
                ),
                MaterialButton(
                  shape: CircleBorder(),
                  elevation: 8.0,
                  child: Center(
                    child: SvgPicture.asset(
                      assetPath,
                      width: constraints.maxHeight * 0.09,
                    ),
                  ),
                  onPressed: () => ontap(),
                ),
              ],
            ),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: constraints.maxWidth * 0.026,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
