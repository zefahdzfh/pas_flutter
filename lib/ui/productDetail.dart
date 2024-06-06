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
                  height: tinggi / 2.41,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: imgList.map((item) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item),
                      fit: BoxFit.cover,
                    ),
                  ),
                )).toList(),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
          ),
          Positioned(
            right: 20,
            top: 245,
            child: InkWell(
              onTap: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
              child: Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                      liked ? Icons.favorite : Icons.favorite_border,
                      color: liked ? Colors.red : Colors.grey,
                      size: 20,
                    ),
                ),
                  
                ),
              ),
            ),
          
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios_rounded, size: 20, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.shopping_cart_outlined, size: 20, color: black),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: tinggi / 2.41 - 20,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: lebar * 0.5, // Adjust the width as needed
                            child: Text(
                              'Classic Grey Hooded Sweatshirt',
                              style: GoogleFonts.rubik(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: black,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          SizedBox(height: 16,),
                          Row(
                            children: [
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(Icons.star, color: Color(0xffFBD914), size: 15);
                                }),
                              ),
                              SizedBox(width: 6),
                              Text(
                                '(270 Review)',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: grey
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (count > 1) {
                                        setState(() {
                                          count -= 1;
                                        });
                                      }
                                    },
                                    child: Icon(Icons.remove, color: black,size: 16,),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    '$count',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(width: 16),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        count += 1;
                                      });
                                    },
                                    child: Icon(Icons.add, color: black,size: 16,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text(
                                'Available in stock',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: black,
                                ),
                              ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description',style: GoogleFonts.rubik(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: black
                      ),),
                      SizedBox(height: 16,),
                  Text(
"The Classic Grey Hooded Sweatshirt is a versatile addition to your casual wardrobe. Made from high-quality cotton blend fabric, this sweatshirt offers both comfort and style. Featuring a classic grey color, it pairs effortlessly with jeans or joggers for a laid-back look. The hood provides added warmth during chilly days, while the front kangaroo pocket adds a practical touch. Whether you're running errands or relaxing at home, this sweatshirt is sure to become a go-to favorite."
,style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey
                  ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Price',
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
           
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${(price * count).toStringAsFixed(2)}',
                  style: GoogleFonts.rubik(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Aksi ketika tombol "Add to cart" ditekan
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 72),
                      child: Row(
                        children: [
                          Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.white,),
                          SizedBox(width: 6,),
                          Text(
                            'Add to cart',
                            style: GoogleFonts.rubik(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
