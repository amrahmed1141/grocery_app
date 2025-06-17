class CategoryModel {
  String name;
  String image;

  CategoryModel({required this.name, required this.image});
}

List<CategoryModel> catgeories = [
  CategoryModel(name: 'Fruits', image: 'assets/category/image 38.png'),
  CategoryModel(name: 'Milk & egg', image: 'assets/category/image 39.png'),
  CategoryModel(name: 'Beverages', image: 'assets/category/image 37.png'),
  CategoryModel(name: 'Laundry', image: 'assets/category/image 41.png'),
   CategoryModel(name: 'Vegetables', image: 'assets/category/image 36.png'),
];
