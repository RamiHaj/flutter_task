class Product
{
  List<ProductModel> products = [];

  Product(this.products);

  Product.fromjson(Map<String , dynamic> json)
  {
    if(json['products'] != null)
    {
      json['products'].forEach((v){
        products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel
{
  String? name;
  String? id;
  int? price;
  double? rate;
  String? description;
  String? imageUrl;
  ProductsMarket? market;

  ProductModel({
    this.name,
    this.id,
    this.price,
    this.rate,
    this.description,
    this.imageUrl,
    this.market,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    id = json['id']?.toString();
    price = json['price']?.toInt();
    rate = json['rate']?.toDouble();
    description = json['description']?.toString();
    imageUrl = json['imageUrl']?.toString();
    market = (json['market'] != null) ? ProductsMarket.fromJson(json['market']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['price'] = price;
    data['rate'] = rate;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    if (market != null) {
      data['market'] = market!.toJson();
    }
    return data;
  }
}

class ProductsMarket
{
  String? name;
  String? address;

  ProductsMarket({
    this.name,
    this.address,
  });
  ProductsMarket.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    address = json['address']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    return data;
  }
}