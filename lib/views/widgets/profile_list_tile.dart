import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/views/pages/orders_page.dart';

class ProfileListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final void Function() onTap;

  const ProfileListTile(
      {super.key,
      required this.leadingIcon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return listItem(context);
  }

  Widget listItem(context) {
    return Platform.isIOS
        ? CupertinoListTile(
            onTap: onTap,
            leading: Icon(
              leadingIcon,
              size: 30,
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          )
        : ListTile(
            onTap: onTap,
            leading: Icon(
              leadingIcon,
              size: 30,
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          );
  }
}
