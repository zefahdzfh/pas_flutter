// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names, non_constant_identifier_names, use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pts2024/widget/kategori.dart';
import 'package:pts2024/widget/product.dart'; // Import widget Product

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = '';
  String searchQuery = '';

  // List of products
  final List<Map<String, String>> products = [
    {
      "name": "Classic Heather Gray Hoodie",
      "img": "assets/img/hoodie.png",
      "deskripsi": "Stay cozy and stylish with our Classic Heather Gray Hoodie.",
      "harga": "69.00"
    },
    {
      "name": "Classic Grey Hooded Sweatshirt",
      "img": "assets/img/hoodie2.png",
      "deskripsi": "Elevate your casual wear with our Classic Grey Hooded Sweatshirt.",
      "harga": "90.00"
    },
    {
      "name": "Classic Heather Gray Hoodie",
      "img": "assets/img/hoodie.png",
      "deskripsi": "Stay cozy and stylish with our Classic Heather Gray Hoodie.",
      "harga": "69.00"
    },
    {
      "name": "Classic Grey Hooded Sweatshirt",
      "img": "assets/img/hoodie2.png",
      "deskripsi": "Elevate your casual wear with our Classic Grey Hooded Sweatshirt.",
      "harga": "90.00"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    var black = Color(0xff0f0f0f);
    var grey = Color(0xffe4e4e4);

    // Filter products based on search query
    List<Map<String, String>> _filterProducts() {
      if (searchQuery.isEmpty) {
        return products; // Show all products if searchQuery is empty
      } else {
        // Filter products based on searchQuery
        return products.where((product) {
          return product['name']!.toLowerCase().contains(searchQuery.toLowerCase());
        }).toList();
      }
    }

    // Build the search bar widget
    Widget _buildSearchBar() {
      return Container(
        margin: EdgeInsets.only(bottom: tinggi * 0.03),
        child: TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value; // Update searchQuery when text changes
            });
          },
          decoration: InputDecoration(
            hintText: "Search...",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            fillColor: grey,
            hintStyle: GoogleFonts.rubik(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Start upper
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Ze-Shoppe",
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundColor: black,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // End upper

              // Search Bar
              _buildSearchBar(),

              // Start category
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 12, // Horizontal spacing between children
                    children: [
                      Category(
                        name: "Clothes",
                        img: "assets/img/clothes.png",
                        isSelected: selectedCategory == "Clothes",
                        onTap: () {
                          setState(() {
                            selectedCategory = "Clothes";
                          });
                        },
                      ),
                      Category(
                        name: "Shoes",
                        img: "assets/img/clothes.png",
                        isSelected: selectedCategory == "Shoes",
                        onTap: () {
                          setState(() {
                            selectedCategory = "Shoes";
                          });
                        },
                      ),
                      Category(
                        name: "Accessories",
                        img: "assets/img/clothes.png",
                        isSelected: selectedCategory == "Accessories",
                        onTap: () {
                          setState(() {
                            selectedCategory = "Accessories";
                          });
                        },
                      ),
                      Category(
                        name: "Electronics",
                        img: "assets/img/clothes.png",
                        isSelected: selectedCategory == "Electronics",
                        onTap: () {
                          setState(() {
                            selectedCategory = "Electronics";
                          });
                        },
                      ),
                      Category(
                        name: "Beauty",
                        img: "assets/img/clothes.png",
                        isSelected: selectedCategory == "Beauty",
                        onTap: () {
                          setState(() {
                            selectedCategory = "Beauty";
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // End category

              // Product Section
              Container(
                child: _filterProducts().isEmpty
                    ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Text("Barang yang dicari Tidak Ditemukan", style: GoogleFonts.rubik(fontSize: 16,fontWeight: FontWeight.w600)),
                        ),
                      ],
                    )
                    : Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.center,
                        spacing: 12, // Horizontal spacing between products
                        runSpacing: 12, // Vertical spacing between products
                        children: _filterProducts().map((product) {
                          return Container(
                            width: (lebar - 64) / 2, // Set width to half of the screen minus spacing
                            child: Product(
                              name: product['name']!,
                              img: product['img']!,
                              deskripsi: product['deskripsi']!,
                              harga: product['harga']!,
                            ),
                          );
                        }).toList(),
                      ),
              ),
              // End product
            ],
          ),
        ),
      ),
    );
  }
}



// // ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names, non_constant_identifier_names, use_full_hex_values_for_flutter_colors

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pts2024/model/model.dart';
// import 'package:pts2024/widget/kategori.dart';
// import 'package:pts2024/widget/product.dart';
// import 'package:pts2024/controlller/homeController.dart'; // Import home controller

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String selectedCategory = '';
//   String searchQuery = '';
//   List<Categories> categories = []; // List untuk menyimpan kategori dari API

//   @override
//   void initState() {
//     super.initState();
//     // Panggil fungsi getCategories() saat widget diinisialisasi
//     getCategories().then((categoryList) {
//       if (categoryList != null) {
//         setState(() {
//           categories = categoryList; // Perbarui daftar kategori
//         });
//       }
//     });
//   }

//   // Build the search bar widget
//   Widget _buildSearchBar() {
//     return Container(
//       margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
//       child: TextField(
//         onChanged: (value) {
//           setState(() {
//             searchQuery = value; // Update searchQuery when text changes
//           });
//         },
//         decoration: InputDecoration(
//           hintText: "Search...",
//           prefixIcon: Icon(Icons.search),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.transparent),
//             borderRadius: BorderRadius.circular(30),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.transparent),
//             borderRadius: BorderRadius.circular(30),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.transparent),
//             borderRadius: BorderRadius.circular(30),
//           ),
//           filled: true,
//           fillColor: Color(0xffe4e4e4),
//           hintStyle: GoogleFonts.rubik(
//             fontSize: 16,
//             color: Colors.grey,
//             fontWeight: FontWeight.w300,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     var tinggi = MediaQuery.of(context).size.height;
//     var lebar = MediaQuery.of(context).size.width;
//     var black = Color(0xff0f0f0f);
//     var grey = Color(0xffe4e4e4);

//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Start upper
//               Container(
//                 margin: EdgeInsets.only(bottom: tinggi * 0.03),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "Ze-Shoppe",
//                           style: GoogleFonts.rubik(
//                             textStyle: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(right: 10),
//                       child: CircleAvatar(
//                         backgroundColor: black,
//                         child: Icon(
//                           Icons.person,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // End upper

//               // Search Bar
//               _buildSearchBar(),

//               // Start category
//               Container(
//                 margin: EdgeInsets.only(bottom: tinggi * 0.03),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Wrap(
//                     spacing: 12, // Horizontal spacing between children
//                     children: categories.map((category) {
//                       return Kategori(
//                         name: category.name,
//                         image: category.image,
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//               // End category

//               // Product Section
//               FutureBuilder<List<Products>?>(
//                 future: getProducts10(), // Call your API method
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     // Display shimmer while waiting for the data
//                     return CircularProgressIndicator(); // Placeholder, bisa diubah sesuai keinginan
//                   } else if (snapshot.hasError) {
//                     // Display error message if there's an error
//                     return Center(
//                       child: Text("Failed to load products"),
//                     );
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     // Display message if no products found
//                     return Center(
//                       child: Text("No products found"),
//                     );
//                   } else {
//                     // Display products
//                     List<Products> products = snapshot.data!;
//                     return Wrap(
//                       alignment: WrapAlignment.spaceBetween,
//                       runAlignment: WrapAlignment.center,
//                       spacing: 12, // Horizontal spacing between products
//                       runSpacing: 12, // Vertical spacing between products
//                       children: products.map((product) {
//                         return Container(
//                           width: (lebar - 64) / 2, // Set width to half of the screen minus spacing
//                           child: ProductWidget(
//                             name: product.title,
//                             img: product.images[0],
//                             deskripsi: product.description,
//                             harga: product.price.toString(),
//                           ),
//                         );
//                       }).toList(),
//                     );
//                   }
//                 },
//               ),
//               // End product
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
