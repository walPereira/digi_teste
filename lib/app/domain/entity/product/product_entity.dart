class ProductEntity {
  final String name;
  final String detail;
  final String price;
  final String? hero;
  final String? info;
  final String? offer;
  final String image;

  ProductEntity({
    required this.name,
    required this.detail,
    required this.price,
    this.hero,
    this.info,
    this.offer,
    required this.image,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      name: json['name'],
      detail: json['detail'],
      price: json['price'],
      hero: json['hero'],
      info: json['info'],
      offer: json['offer'],
      image: json['image'],
    );
  }
}
