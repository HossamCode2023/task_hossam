// To parse this JSON data, do
//
//     final productsCartModel = productsCartModelFromJson(jsonString);

class ProductsCartModel {
  List<Product> products;

  ProductsCartModel({
    required this.products,
  });

  factory ProductsCartModel.fromJson(Map<String, dynamic> json) =>
      ProductsCartModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  int id;
  String title;

  String category;
  String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "thumbnail": thumbnail,
      };
}
