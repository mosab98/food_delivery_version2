import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/views/pages/cart_page.dart';
import 'package:food_delivery/views/widgets/checkout.dart';
import 'package:food_delivery/views/widgets/counter_widget.dart';
import 'package:food_delivery/views/widgets/property_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:food_delivery/views/widgets/counter_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
  });

  static const String routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: AppColors.grey2,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(
                CartPage.routeName,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 350,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.grey2,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 60.0),
                          child: CachedNetworkImage(
                            imageUrl: product.imgUrl,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 6,
                      width: 80,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.grey2,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.category.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: AppColors.grey,
                                        ),
                                  ),
                                ],
                              ),
                              const CounterWidget(),
                            ],
                          ),
                          const SizedBox(height: 36),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PropertyItem(
                                title: 'Size',
                                value: 'Medium',
                              ),
                              SizedBox(
                                height: 24,
                                child: VerticalDivider(),
                              ),
                              PropertyItem(
                                title: 'Calories',
                                value: '150 Kcal',
                              ),
                              SizedBox(
                                height: 24,
                                child: VerticalDivider(),
                              ),
                              PropertyItem(
                                title: 'Cooking',
                                value: '5-10 mins',
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            product.description,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: AppColors.grey,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
              child: Checkout(),
            ),
          ],
        ),
      ),
    );
  }
}
