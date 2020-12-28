class Product {
  final String title, description, sku, createdAt, updatedAt, image;
  final String id, category;
  final String price, discount;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.sku,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.discount,
    this.image,
  });
}

List<Product> products = [];
