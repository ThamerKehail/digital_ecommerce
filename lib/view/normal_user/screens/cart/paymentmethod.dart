import 'package:ecommerceapp/controller/cart/paymentmethod_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/paymentmethodeenum.dart';
import '../../widgets/auth/custom_buttom_auth.dart';
import '../../widgets/cart/customcartappbar.dart';
import '../../widgets/payment/choosepaymentmethodcard.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentMethodsControllerImp controller =
        Get.put(PaymentMethodsControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const CustomCartAppbar(
              title: "Payment Methods",
            ),
            GetBuilder<PaymentMethodsControllerImp>(builder: (controller) {
              return Column(
                children: [
                  ChoosePaymentMethodCard(
                      character: controller.character,
                      onChange: (v) {
                        controller.changeMethods(v!);
                      },
                      image: 'assets/images/mastercard.svg',
                      title: '***156',
                      value: SingingCharacter.mastercard),
                  ChoosePaymentMethodCard(
                      character: controller.character,
                      onChange: (v) {
                        controller.changeMethods(v!);
                      },
                      image: 'assets/images/visa.svg',
                      title: '***156',
                      value: SingingCharacter.visa),
                  ChoosePaymentMethodCard(
                      character: controller.character,
                      onChange: (v) {
                        controller.changeMethods(v!);
                      },
                      image: 'assets/images/paypal.svg',
                      title: '***156',
                      value: SingingCharacter.paypal),
                  ChoosePaymentMethodCard(
                      character: controller.character,
                      onChange: (v) {
                        controller.changeMethods(v!);
                      },
                      image: 'assets/images/cash-on-delivery.svg',
                      title: 'Cash On Delivery',
                      value: SingingCharacter.cash),
                ],
              );
            }),
            const SizedBox(
              height: 50,
            ),
            CustomButtomAuth(
                onPressed: () {
                  controller.goToCheckoutDetails();
                },
                text: "Continue"),
          ],
        ),
      ),
    );
  }
}
