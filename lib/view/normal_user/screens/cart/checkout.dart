import 'package:ecommerceapp/controller/cart/checkout_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/auth/custom_buttom_auth.dart';
import '../../widgets/auth/customtextformfield.dart';
import '../../widgets/cart/customcartappbar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: controller.formsState,
          child: ListView(
            children: [
              const CustomCartAppbar(
                title: "Address",
              ),
              Image.asset(
                "assets/images/your_location.png",
                height: 300,
              ),
              const Text(
                "Fill Your Current Address",
                style: TextStyle(
                  color: ColorApp.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                hint: "Enter your Country",
                label: "Country",
                iconData: Icons.location_city_outlined,
                myController: controller.country,
                validator: (String? val) {
                  return validInput(val!, 3, 50, "");
                },
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                hint: "Enter your City",
                label: "City",
                iconData: Icons.location_city_outlined,
                myController: controller.city,
                validator: (String? val) {
                  return validInput(val!, 3, 50, "");
                },
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                hint: "Enter your Street",
                label: "Street",
                iconData: Icons.location_city_outlined,
                myController: controller.street,
                validator: (String? val) {
                  return validInput(val!, 3, 50, "");
                },
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                hint: "Enter your Phone Number",
                label: "Phone",
                iconData: Icons.phone_outlined,
                myController: controller.phone,
                validator: (String? val) {
                  return validInput(val!, 3, 50, "");
                },
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                hint: "Enter your Note",
                label: "Note",
                max: 5,
                iconData: Icons.note_add_outlined,
                myController: controller.note,
                validator: (String? val) {
                  return validInput(val!, 3, 50, "");
                },
                keyboardType: TextInputType.emailAddress,
              ),
              CustomButtomAuth(
                  onPressed: () {
                    controller.addAddress();
                  },
                  text: "SEND"),
            ],
          ),
        ),
      ),
    );
  }
}
