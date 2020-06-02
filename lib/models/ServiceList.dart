class CartPojo {
  String idcart;
  String productId;
  String brandName;
  String productName;
  String productPrice;
  String productImg;

  CartPojo(
      {this.idcart,
        this.productId,
        this.brandName,
        this.productName,
        this.productPrice,
        this.productImg});

  CartPojo.fromJson(Map<String, dynamic> json) {
    idcart = json['idcart'];
    productId = json['product_id'];
    brandName = json['brand_name'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    var a = json['product_img'];
    productImg = 'https://mart-bazaar.000webhostapp.com/api/shoes/$a';
  }
}