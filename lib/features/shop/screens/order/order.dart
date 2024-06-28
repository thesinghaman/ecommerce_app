import 'package:flutter/material.dart';

import '/common/widgets/appbar/appbar.dart';
import '/utils/constants/sizes.dart';
import 'widgets/orders_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: AAppBar(
          title: Text('My Orders',
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(ASizes.defaultSpace),

        /// -- Orders
        child: AOrderListItems(),
      ),
    );
  }
}
