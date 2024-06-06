// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Profile Page',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff1B1B1B)),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Color(0xff1B1B1B),
              ),
            ),
          ]),
      body: Padding(
         padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                SizedBox(width: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Zefa Hudzaifah',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1B1B1B)
                    ),),
                    SizedBox(height: 6,),
                    Text('160002359102022',style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6C6C6C)
                    ),)
                  ],
                )
              ],
            ),
            SizedBox(height: 24,),
            borders(),
            // SizedBox(height: 24,),
            profile_menus(Icons.person,'My Profile'),
            borders(),
            profile_menus(Icons.shopping_bag_rounded,'Cart'),
            borders(),
            profile_menus(Icons.star,'Reviews'),
            borders(),
            profile_menus(Icons.card_giftcard_rounded,'Rewards'),
            borders(),
            profile_menus(Icons.help_outline_rounded,'Help & FAQs'),
            borders(),
          ],
        ),
      ),
    );
  }

  InkWell profile_menus(IconData icons_selection, String Title) {
    return InkWell(
            onTap: () {},
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icons_selection),
                    SizedBox(width: 6,),
                    Text(Title,style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1B1B1B)
                    ),)
                  ],
                ),
              ),
            ),
          );
  }

  Container borders() {
    return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffE7E7E7))
            ),
          );
  }
}