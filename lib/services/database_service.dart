import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  Future addUserDetails(Map<String, dynamic> userData, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userData);
  }

  Future addProductItem(Map<String, dynamic> userData, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(userData);
  }

  Future<Stream<QuerySnapshot>> getProductItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addFoodToCart(Map<String, dynamic> userData, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('Cart')
        .add(userData);
  }

  Stream<QuerySnapshot> getFoodCart(String id)  {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('Cart')
        .snapshots();
  }
  Future<QuerySnapshot> getFoodCartItems(String userId) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('Cart')
        .get();
  }

  Future<void> deleteFoodCartItem(String userId, String itemId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('Cart')
        .doc(itemId)
        .delete();
  }
  
}