import 'package:ecom/DioClient.dart';
import 'package:ecom/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'Product.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Provider.of<Products>(context, listen: false).fetchProductList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(child: Consumer<Products>(
        builder: (BuildContext context, value, Widget? child) {
          print(value.list.length);
          if (value.list.length == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Categories',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12
                  ),
                  itemCount: value.list.length,
                  itemBuilder: (context, index) {
                    return mybuild(value.list[index]);
                  },
                ),
              ],
            );
          }
        },
      )),
    );
  }
}

class FeaturedProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.shopping_bag,
              size: 60,
              color: Colors.grey,
            ),
            Text(
              'Product Name',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}

Widget mybuild(ProductModel list) {
  return Expanded(child: Container(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: <Widget>[
         const Icon(
          Icons.grid_view,
          size: 30,
          color: Colors.grey,
        ),
        Expanded(child: Text(
          list.title.toString(),
        ),
        ),
      ],
    ),
    ),
  );
}
