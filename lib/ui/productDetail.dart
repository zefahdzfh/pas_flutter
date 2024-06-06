// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool liked = false;
  int count = 1;

  double price = 70.00;
  int _current = 0;
  final List<String> imgList = [
    'assets/img/hoodie.png',  // ganti dengan path image Anda
    'assets/img/hoodie11.png',
    'assets/img/hoodie12.png'
  ];

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    var black = Color(0xff0f0f0f);
    var grey = Color(0xffe4e4e4);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: tinggi / 2.41,
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: imgList.map((item) => Container(
                  child: Center(
                    child: Image.asset(item, fit: BoxFit.cover, width: lebar),
                  ),
                )).toList(),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios),
                ),
                Icon(Icons.file_upload_outlined),
              ],
            ),
          ),
          Positioned(
            top: tinggi / 2.65,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Classic Heather Gray Hoodie",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            liked = !liked;
                          });
                        },
                        child: Icon(
                          liked ? Icons.favorite : Icons.favorite_outline,
                          color: liked ? Colors.red : black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: tinggi * 0.01),
                  Row(
                    children: [
                      Icon(Icons.star, size: 15, color: Colors.amber),
                      Icon(Icons.star, size: 15, color: Colors.amber),
                      Icon(Icons.star, size: 15, color: Colors.amber),
                      Icon(Icons.star, size: 15, color: Colors.amber),
                      Icon(Icons.star, size: 15, color: Colors.amber),
                      SizedBox(width: 10),
                      Text(
                        "(450)",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: tinggi * 0.01),
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: tinggi * 0.02),
                  Text(
                    "Stay cozy and stylish with our Classic Heather Gray Hoodie, "
                    "made from a soft and durable blend of materials. Perfect for "
                    "everyday wear or layering during colder months.",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: tinggi * 0.02),
                  Text(
                    "Size",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: tinggi * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ["S", "M", "L", "XL", "XXL"]
                        .map((size) => Container(
                      width: lebar / 6,
                      height: tinggi * 0.06,
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          size,
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ))
                        .toList(),
                  ),
                  SizedBox(height: tinggi * 0.02),
                  Text(
                    "Quantity",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: tinggi * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: lebar / 4,
                        height: tinggi * 0.06,
                        decoration: BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (count > 1) {
                                    setState(() {
                                      count--;
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                count.toString(),
                                style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: lebar / 2.5,
                        height: tinggi * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

