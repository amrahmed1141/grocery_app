class CategoryModel {
  String name;
  String image;

  CategoryModel({required this.name, required this.image});
}

List<CategoryModel> catgeories = [
  CategoryModel(name: 'Fashion', image: 'assets/category/📱 (1).png'),
  CategoryModel(name: 'Electronics', image: 'assets/category/📱.png'),
  CategoryModel(name: 'Furniture', image: 'assets/category/📱 (2).png'),
  CategoryModel(name: 'Health', image: 'assets/category/📱 (4).png'),
   CategoryModel(name: 'TVs', image: 'assets/category/📱 (3).png'),
];
