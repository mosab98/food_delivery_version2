import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/views/pages/order_details_page.dart';
import 'package:food_delivery/views/widgets/app_drawer.dart';
import 'package:food_delivery/views/widgets/custom_app_bar.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});
  static const String routeName = '/orders-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: CustomAppBar(),
        ),
        body: SafeArea(
          child: orders.isEmpty
              ? const Center(child: Text("No orders"))
              : ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final detalsProduct = orders[index]['order'];

                    //debugPrint(detalsProduct.toString() );
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            OrderDetailsPage.routeName,
                            arguments: detalsProduct);
                      },
                      child: const Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Order'),
                                    subtitle: Text('#5555'),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('Date'),
                                    subtitle: Text('March 27, 2024'),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text('	Status'),
                                    subtitle: Text('Completed'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
        ));
  }
}
