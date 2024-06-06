// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pts2024/ui/productDetail.dart';
import 'package:pts2024/ui/productPage.dart';

class Product extends StatefulWidget {
  final String name;
  final String img;
  final String deskripsi;
  final String harga;
  const Product({
    super.key,
    required this.name,
    required this.img,
    required this.deskripsi,
    required this.harga,
  });

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductDetail()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(12), // Mengatur border radius
                  child: Image.asset(widget.img),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLoved = !isLoved;
                      });
                    },
                    child: Container(
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          isLoved ? Icons.favorite : Icons.favorite_border,
                          color: isLoved ? Colors.red : Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              widget.name,
              style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff0f0f0f)),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              widget.deskripsi,
              maxLines: 1, // Membatasi teks menjadi satu baris
              overflow: TextOverflow
                  .ellipsis, // Menambahkan ellipsis jika teks terlalu panjang
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              widget.harga,
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff0f0f0f)),
            )
          ],
        ),
      ),
    );
  }
}
// // ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names, non_constant_identifier_names
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ProductWidget extends StatefulWidget {
//   final String name;
//   final String img;
//   final String deskripsi;
//   final String harga;
//   const ProductWidget({
//     super.key,
//     required this.name,
//     required this.img,
//     required this.deskripsi,
//     required this.harga,
//   });

//   @override
//   _ProductWidgetState createState() => _ProductWidgetState();
// }

// class _ProductWidgetState extends State<ProductWidget> {
//   bool isLoved = false;

//   @override
//   Widget build(BuildContext context) {
//     // Parse the image URL from the provided string
//     String imageUrl = widget.img.substring(2, widget.img.length - 2);

//     return Container(
//       width: MediaQuery.of(context).size.width * 0.4,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.network(imageUrl), // Use the parsed image URL
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isLoved = !isLoved;
//                     });
//                   },
//                   child: Container(
//                     width: 32,
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.5),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(4),
//                       child: Icon(
//                         isLoved ? Icons.favorite : Icons.favorite_border,
//                         color: isLoved ? Colors.red : Colors.white,
//                         size: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 12,
//           ),
//           Text(
//             widget.name,
//             style: GoogleFonts.rubik(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xff0f0f0f)),
//           ),
//           SizedBox(
//             height: 12,
//           ),
//           Text(
//             widget.deskripsi,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: GoogleFonts.rubik(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.grey),
//           ),
//           SizedBox(
//             height: 12,
//           ),
//           Text(
//             widget.harga,
//             style: GoogleFonts.rubik(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xff0f0f0f)),
//           )
//         ],
//       ),
//     );
//   }
// }
