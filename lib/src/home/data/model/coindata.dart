class CoinData {
  final String name;
  final String symbol;
  final String image;
  final int price;
  final String change;
  final int state;

  CoinData(
      this.name, this.symbol, this.image, this.price, this.change, this.state);

/*  CoinDatas.fromJson(Map<String, dynamic> json) {
    name = json['id'];
    name_abb = json['name'];
    image = json['image'];
    price = json['price'];
    change = json['change'];
    state = json['state'];
  }*/

// CoinDatas({required this.name,required this.name_abb,required this.image,required this.price,required this.change,required this.state});

}
