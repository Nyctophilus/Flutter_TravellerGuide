class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;
  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });

  factory DataModel.fromJson(Map<String, dynamic> varJson) {
    return DataModel(
        name: varJson["name"],
        img: varJson["img"],
        price: varJson["price"],
        people: varJson["people"],
        stars: varJson["stars"],
        description: varJson["description"],
        location: varJson["location"]);
  }
}
