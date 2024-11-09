import 'dart:io';

import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameContoller = TextEditingController();
  final TextEditingController descriptionNameContoller =
      TextEditingController();
  final TextEditingController priceNameContoller = TextEditingController();
  final TextEditingController quantityNameContoller = TextEditingController();

  String category = 'Mobiles';

  List<File> images = [];

  @override
  void dispose() {
    super.dispose();
    priceNameContoller.dispose();
    productNameContoller.dispose();
    quantityNameContoller.dispose();
    descriptionNameContoller.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Add Product',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: selectImages,
                  child: DottedBorder(
                    dashPattern: const [10, 4],
                    strokeCap: StrokeCap.round,
                    radius: const Radius.circular(10),
                    borderType: BorderType.RRect,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.folder_open,
                            size: 40,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Select Product Images',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: productNameContoller,
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionNameContoller,
                  hintText: 'Description',
                  maxLines: 5,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: quantityNameContoller,
                  hintText: 'Quantity',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: priceNameContoller,
                  hintText: 'Price',
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(text: 'Sell', onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
