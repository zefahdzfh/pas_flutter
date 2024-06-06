// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatelessWidget {
  final String name;
  final String img;
  final bool isSelected;
  final VoidCallback onTap;

  const Category({
    Key? key,
    required this.name,
    required this.img,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        onEnter: (_) {},
        onExit: (_) {},
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.black : Colors.transparent,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    child: Text(
                      name,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Kategori extends StatelessWidget {
//   final String name;
//   final String image;
//   final VoidCallback? onTap; // Jadikan callback onTap opsional

//   const Kategori({
//     Key? key,
//     required this.name,
//     required this.image,
//     this.onTap, // Tambahkan tanda tanya (?) agar menjadi opsional
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap, // Panggil callback onTap jika tidak null
//       child: Container(
//         margin: EdgeInsets.only(right: 12),
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.transparent,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(30),
//           child: Stack(
//             children: [
//               Image.network(
//                 image,
//                 fit: BoxFit.cover,
//                 width: 120,
//                 height: 60,
//               ),
//               Positioned.fill(
//                 child: Container(
//                   color: Colors.black.withOpacity(0.5),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   name,
//                   style: GoogleFonts.rubik(
//                     textStyle: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
