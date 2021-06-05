import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/screens/single_product_screen.dart';
import 'package:flutter/material.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SingleProductScreen(product),
        )),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(8),
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Hero(
                    tag: 'photo${product.id}',
                    child: Image.network(
                      product.image,
                      fit: BoxFit.contain,
                      width: constraints.maxWidth,
                      height: constraints.maxWidth * 1.5,
                    ),
                  ),
                  Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    product.category,
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .color!
                            .withOpacity(0.5)),
                  ),
                  Text(
                    '\$' + product.price.toString(),
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
