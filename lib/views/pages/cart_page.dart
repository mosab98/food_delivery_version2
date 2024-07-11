import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/views/pages/orders_page.dart';
import 'package:food_delivery/views/widgets/app_drawer.dart';
import 'package:food_delivery/views/widgets/counter_widget.dart';
import 'package:food_delivery/views/widgets/custom_app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
  static const String routeName = '/cart-page';
}

class _CartPageState extends State<CartPage> {
  String a = (chartProducts.length).toString();
  List<Map<String, dynamic>> dummyOrders = [];

  @override
  Widget build(BuildContext context) {
    List productInOrder = [];
    List countProductInOrder = [];
    List priceProductInOrder = [];
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: chartProducts.isEmpty
            ? const Center(child: Text("No Products in cart"))
            : Column(
                children: [
                  Expanded(
                    flex: 12,
                    child: ListView.builder(
                        itemCount: chartProducts.length,
                        itemBuilder: (context, index) {
                          final ProductModel productCart =
                              chartProducts[index]['product'];
                          productInOrder.add(productCart.name);
                          countProductInOrder
                              .add(chartProducts[index]['count']);
                          priceProductInOrder.add(productCart.price *
                              chartProducts[index]['count']);

                          debugPrint(productInOrder.toString());
                          debugPrint(countProductInOrder.toString());
                          debugPrint(priceProductInOrder.toString());

                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                onTap: () {},
                                leading: Image.network(
                                  productCart.imgUrl,
                                  height: 100,
                                  width: 70,
                                  fit: BoxFit.fill,
                                ),
                                title: Text(
                                  productCart.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                subtitle: Text(
                                  ' \$${productCart.price} * ${chartProducts[index]['count']} = \$${productCart.price * chartProducts[index]['count']}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                trailing: orientation == Orientation.portrait
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            total = total -
                                                (productCart.price *
                                                    chartProducts[index]
                                                        ['count']);
                                            chartProducts.removeWhere(
                                                (element) =>
                                                    element["product"] ==
                                                        productCart &&
                                                    element["count"] ==
                                                        chartProducts[index]
                                                            ['count']);

                                            debugPrint(
                                                productInOrder.toString());
                                            debugPrint(
                                                countProductInOrder.toString());
                                            debugPrint(
                                                priceProductInOrder.toString());

                                            countInChart--;
                                          });
                                        },
                                        icon: const Icon(Icons.delete),
                                        color: Theme.of(context).primaryColor,
                                      )
                                    : TextButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            total = total -
                                                (productCart.price *
                                                    chartProducts[index]
                                                        ['count']);
                                            chartProducts.removeWhere(
                                                (element) =>
                                                    element["product"] ==
                                                        productCart &&
                                                    element["count"] ==
                                                        chartProducts[index]
                                                            ['count']);
                                          });
                                        },
                                        icon: const Icon(Icons.delete),
                                        label: const Text('Delete'),
                                      ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                '\$${total.toStringAsFixed(2)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      orders.add({
                                        "order": {
                                          'orderProduct': productInOrder,
                                          'countProduct': countProductInOrder,
                                          'totlePriceProduct':
                                              priceProductInOrder
                                        }
                                      });
                                      chartProducts.clear();
                                      total = 0;
                                      countInChart = 0;
                                    });

                                    debugPrint(orders.toString());
                                    Navigator.of(context).pushNamed(
                                      OrdersPage.routeName,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    foregroundColor: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text('Complete'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
