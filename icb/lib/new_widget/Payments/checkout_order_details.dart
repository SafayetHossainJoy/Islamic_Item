import 'package:flutter/material.dart';
import 'package:icb/new_widget/Payments/order_summary_component.dart';

class CheckoutOrderDetails extends StatelessWidget {
  const CheckoutOrderDetails({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        OrderSummaryComponent(title: 'Order', value: '01'),
        SizedBox(height: 8.0),
        OrderSummaryComponent(title: 'Delivery', value: '430 \৳'),
        SizedBox(height: 8.0),
        OrderSummaryComponent(title: 'Summary', value: ''),
      ],
    );
  }
}
