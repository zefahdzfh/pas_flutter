// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names, non_constant_identifier_names, use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pts2024/widget/product.dart'; // Import widget Product

class Productpage extends StatefulWidget {
  const Productpage({Key? key}) : super(key: key);

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
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
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          var gridCount = constraints.maxWidth < 600 ? 2 : 4;
                          return Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            runAlignment: WrapAlignment.center,
                            spacing: 12, // Horizontal spacing between products
                            runSpacing: 12, // Vertical spacing between products
                            children: _filterProducts().map((product) {
                              return Container(
                                width: (constraints.maxWidth - (gridCount - 1) * 12) / gridCount,
                                child: Product(
                                  name: product['name']!,
                                  img: product['img']!,
                                  deskripsi: product['deskripsi']!,
                                  harga: product['harga']!,
                                ),
                              );
                            }).toList(),
                          );
                        },
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
