import 'dart:io';

import 'package:eshop_app/viewModel/admin/add_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eshop_app/utils/constant.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddProductViewModel>(context, listen: false);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Consumer<AddProductViewModel>(
          builder: (context, model, child) => Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'EShop',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/logo/logo-big.png',
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Stack(
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: model.selecctedImage == null
                                ? IconButton(
                                    icon: const Icon(Icons.camera_alt_outlined),
                                    onPressed: () => viewModel.pickImage(),
                                  )
                                : Image.file(
                                    File(viewModel.selecctedImage!.path),
                                    fit: BoxFit.cover,
                                  )),
                      ),
                    ),
                    if (model.selecctedImage != null)
                      Positioned(
                        right: -10,
                        top: -10,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () => viewModel.removeImage(),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(model.nameController, 'Product Name', 60),
              const SizedBox(height: 20),
              _buildTextField(model.priceController, 'Product Price', 60),
              const SizedBox(height: 20),
              _buildTextField(
                  model.descriptionController, 'Product Description', 90),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  value: model.selectedCategory,
                  hint: const Text('Choose Category'),
                  isExpanded: true,
                  items: model.categories
                      .map((category) => DropdownMenuItem(
                          value: category, child: Text(category)))
                      .toList(),
                  onChanged: (value) {
                    model.selectedCategory = value;
                    model.notifyListeners();
                  },
                )),
              ),
              const SizedBox(height: 30),
              Center(
                child: model.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () => viewModel.addProduct(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                        child: const Text('Add Product',style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildTextField(
      TextEditingController controller, String hintText, double height,
      {int maxline = 3, TextInputType keyboardType = TextInputType.text}) {
    return Container(
      height: height,
      margin: const EdgeInsets.all(10),
      child: TextField(
          controller: controller,
          maxLines: maxline,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: '$hintText',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.deepPurple)))),
    );
  }
}
