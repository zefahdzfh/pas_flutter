// // To parse this JSON data, do
// //
// //     final categories = categoriesFromJson(jsonString);

// part of 'model.dart';

// List<Categories> categoriesFromJson(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

// String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Categories {
//     int id;
//     String name;
//     String image;
//     DateTime creationAt;
//     DateTime updatedAt;

//     Categories({
//         required this.id,
//         required this.name,
//         required this.image,
//         required this.creationAt,
//         required this.updatedAt,
//     });

//     factory Categories.fromJson(Map<String, dynamic> json) => Categories(
//         id: json["id"],
//         name: json["name"],
//         image: json["image"],
//         creationAt: DateTime.parse(json["creationAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "image": image,
//         "creationAt": creationAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//     };
// }
