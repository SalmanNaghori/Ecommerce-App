class ProductModel {
  String? category;
  String? title;
  String? discription;
  int? price;
  List<String>? image;
  String? sId;
  String? updatedOn;
  String? createdOn;

  ProductModel(
      {this.category,
      this.title,
      this.discription,
      this.price,
      this.image,
      this.sId,
      this.updatedOn,
      this.createdOn});

  ProductModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    title = json['title'];
    discription = json['discription'];
    price = json['price'];
    image = json['image'].cast<String>();
    sId = json['_id'];
    updatedOn = json['updatedOn'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['title'] = this.title;
    data['discription'] = this.discription;
    data['price'] = this.price;
    data['image'] = this.image;
    data['_id'] = this.sId;
    data['updatedOn'] = this.updatedOn;
    data['createdOn'] = this.createdOn;
    return data;
  }
}
