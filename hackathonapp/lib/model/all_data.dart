// for login page

var username;
var useremail;
var userinput;
// for cart counter

int counter = 0;

class HorCat {
  // Signle Item Structure shown in horizontal view
  dynamic name;
  dynamic img;

  HorCat({
    required this.name,
    required this.img,
  });
}

List<dynamic> horItems = [
  // HardQuoted
  // List of all Items shown in horizontal view
  HorCat(name: "Suit", img: "assets/suit1.png"),
  HorCat(name: "Sports", img: "assets/shoe2.png"),
  HorCat(name: "Ladies Shoes", img: "assets/shoe4.png"),
];

class VertCat {
  dynamic name;
  dynamic img;
  dynamic discount;
  dynamic price;
  bool isFav;
  bool isCart;

  VertCat({
    required this.name,
    required this.img,
    required this.discount,
    required this.price,
    required this.isFav,
    required this.isCart,
  });
}

List<dynamic> vertItems = [
  VertCat(
    name: "Men's Shirt",
    img: "assets/shirt.png",
    discount: 30,
    price: 119,
    isFav: false,
    isCart: false,
  ),
  VertCat(
    name: "Men's Suit",
    img: "assets/suit1.png",
    discount: 10,
    price: 99,
    isFav: false,
    isCart: false,
  ),
  VertCat(
    name: "Lady Shoes",
    img: "assets/shoe4.png",
    discount: 20,
    price: 399,
    isFav: false,
    isCart: false,
  ),
];

List<VertCat> cartlist = [];
List<VertCat> favoritelist = [];
