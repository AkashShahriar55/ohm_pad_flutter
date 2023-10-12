
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohm_pad_flutter/consts/colors.dart';

import '../consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: whiteColor,))
        ],
        leading: const Icon(Icons.sort_rounded, color: whiteColor),
        title: Text(
            "Ohm Pad",
            style:
            customFontStyle(
              family: bold,
              size: 18
            )
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 100,
          itemBuilder: (BuildContext context, int index){
            return Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                ),
                tileColor: bgColor,
                title: Text(
                  "Music Name",
                  style: customFontStyle(
                  family: bold, size: 15
                ),),
                subtitle: Text(
                  "Artist Name",
                  style: customFontStyle(
                      family: bold, size: 15
                  ),),
                leading: const Icon(Icons.music_note ,color: whiteColor, size: 32),
                trailing: const Icon(Icons.play_arrow, color: whiteColor, size: 26,),
              ),
            );
          }
      ),
    );
  }
}
