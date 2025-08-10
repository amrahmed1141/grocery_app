import 'dart:io';

import 'package:eshop_app/models/home/products_model.dart';
import 'package:eshop_app/services/database_service.dart';
import 'package:eshop_app/services/shared_perefrence.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddProductViewModel extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
 

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? selectedCategory;
  bool isLoading = false;
  File? selecctedImage;

  final List<String> categories = [
    'Electronics',
    'Fashion',
    'Furniture',
    'Health',
    'TVs'
  ];

  Future<void> pickImage() async {
    final pickFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      selecctedImage = File(pickFile.path);
      notifyListeners();
    }
  }

  void removeImage() {
    selecctedImage = null;
    notifyListeners();
  }

  Future<void> addProduct(BuildContext context) async {
    if (nameController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedCategory == null ||
        selecctedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all fields and select an image')),
      );
      return;
    }
    try{
    isLoading = true;
    notifyListeners();

    final String addId = randomAlphaNumeric(10);

    // pick image to firebasestorage then download the file as url
    final Reference storageRef =
        FirebaseStorage.instance.ref().child('products/$addId.jpg');
    final UploadTask uploadTask = storageRef.putFile(selecctedImage!);
    final TaskSnapshot snapshot = await uploadTask;
    final String imageUrl = await snapshot.ref.getDownloadURL();

    final product = ProductModel(
        id: addId,
        imageUrl: imageUrl,
        name: nameController.text,
        price: priceController.text,
        detail: descriptionController.text,
        category: selectedCategory!);

    await _databaseService.addProductItem(product.toMap(), selectedCategory!);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product added successfully')),
    );

    // Reset form
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    selecctedImage = null;
    selectedCategory = null;

    notifyListeners();
    } catch(e){
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally{
      isLoading = false;
      notifyListeners();
    }
  }
  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
