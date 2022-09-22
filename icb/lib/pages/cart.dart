import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/utils.dart';
import 'package:icb/Core/extensions.dart';
import 'package:icb/controller/product_controller.dart';
import 'package:icb/new_widget/Payments/payment.dart';
import 'package:icb/product_model/product.dart';
import 'package:icb/widget/animated_switcher_wrapper.dart';
import 'package:icb/widget/empty_cart.dart';

final ProductController controller = Get.put(ProductController());

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My cart",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: !controller.isEmptyCart
                ? ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.cartProducts.length,
                    itemBuilder: (_, index) {
                      Product product = controller.cartProducts[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(15),
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.grey[200]?.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: Colors.black
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    product.images[0],
                                    width: 80,
                                    height: 120,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    product.name.nextLine,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    controller.getCurrentSize(product),
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  Text(
                                    controller.isPriceOff(product)
                                        ? product.off.toString()
                                        : product.price.toString(),
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  IconButton(
                                    //  splashRadius: 3.0,
                                    onPressed: () =>
                                        controller.decreaseItem(index),
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Color(0xFFEC6813),
                                    ),
                                  ),
                                  GetBuilder<ProductController>(
                                    builder: (ProductController controller) {
                                      return AnimatedSwitcherWrapper(
                                        child: Text(
                                          controller
                                              .cartProducts[index].quantity
                                              .toString(),
                                          key: ValueKey<int>(controller
                                              .cartProducts[index].quantity),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    // splashRadius: 3.0,
                                    onPressed: () =>
                                        controller.increaseItem(index),
                                    icon: const Icon(
                                      Icons.add,
                                      color: Color(0xFFEC6813),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                : const EmptyCart(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
                  Obx(() {
                    return AnimatedSwitcherWrapper(
                      child: Text(
                        controller.totalPrice.value.toString(),
                        key: ValueKey<int>(controller.totalPrice.value),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFEC6813),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: ElevatedButton(
                  child: const Text("Buy Now"),
                  onPressed: controller.isEmptyCart
                      ? null
                      : () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => paymentpage(),
                              ));
                        },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
