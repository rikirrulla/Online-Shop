class Order {
  final String id,
      title,
      image,
      createdAt,
      numOfItems,
      subTotal,
      price,
      status,
      mobile,
      name,
      line1,
      line2,
      city,
      transport,
      payment,
      country;

  Order(
      {this.id,
      this.title,
      this.image,
      this.numOfItems,
      this.price,
      this.status,
      this.payment,
      this.transport,
      this.mobile,
      this.name,
      this.line1,
      this.line2,
      this.city,
      this.country,
      this.subTotal,
      this.createdAt});
}

List<Order> orders = [];
