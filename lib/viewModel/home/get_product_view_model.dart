import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop_app/services/database_service.dart';
import 'package:flutter/material.dart';

class GetProductViewModel extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  Stream<QuerySnapshot>? productStream;

  String selectedCategory = 'Fashion';

  GetProductViewModel() {
    loadInitalData();
  }

  void loadInitalData() {
    getProductsByCatgeory(selectedCategory);
  }

  Future<void> getProductsByCatgeory(String category) async {
    selectedCategory = category;
    productStream = await _databaseService.getProductItem(category);
    notifyListeners();
  }
}
