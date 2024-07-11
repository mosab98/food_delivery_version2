import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/views/pages/coupons_page.dart';
import 'package:food_delivery/views/pages/orders_page.dart';
import 'package:food_delivery/views/widgets/orders_coupons_widget.dart';
import 'package:food_delivery/views/widgets/profile_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              CircleAvatar(
                radius:
                    size.width > 800 ? size.height * 0.2 : size.height * 0.1,
                backgroundImage: const NetworkImage(
                  'https://images.inc.com/uploaded_files/image/1920x1080/getty_481292845_77896.jpg',
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Ahmed Mohamed',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6.0),
              const Text(
                'Software Engineer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OrdersCouponsWidget(
                    title: 'Orders',
                    value: orders.length,
                  ),
                  const SizedBox(
                    height: 45,
                    child: VerticalDivider(),
                  ),
                  const OrdersCouponsWidget(
                    title: 'Coupons',
                    value: 5,
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              if (!Platform.isIOS) ...[
                ProfileListTile(
                  leadingIcon: Icons.shopping_cart_outlined,
                  title: 'Orders',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      OrdersPage.routeName,
                    );
                  },
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                ProfileListTile(
                  leadingIcon: Icons.card_giftcard_outlined,
                  title: 'Coupons',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      CouponsPage.routeName,
                    );
                  },
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
              ] else
                CupertinoListSection(
                  children: [
                    ProfileListTile(
                      leadingIcon: Icons.shopping_cart_outlined,
                      title: 'Orders',
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          OrdersPage.routeName,
                        );
                      },
                    ),
                    ProfileListTile(
                      leadingIcon: Icons.card_giftcard_outlined,
                      title: 'Coupons',
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          CouponsPage.routeName,
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
