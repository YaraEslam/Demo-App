import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/routes/app_routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'color.dart';

class Ui {

  static TextStyle textStyle = const TextStyle();

  static svgIcon(String icon, Color color){
    return SvgPicture.asset("assets/icons/$icon.svg", color: color,);
  }

  static appBar(String text){
    return AppBar(
      backgroundColor: white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
              // color: Colors.red,
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(20),
              //   topLeft: Radius.circular(20),
              //   topRight: Radius.circular(4),
              //   bottomRight: Radius.circular(16),
              // ),
              image: DecorationImage(
                image: AssetImage("assets/images/appbarBG.png", ),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.location_on,size: 20, color: white,),
                Text(text, style: Ui.textStyle.copyWith(
                    fontSize: 12,color: white
                ),),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(Get.context!).size.width/10,
            height: MediaQuery.of(Get.context!).size.width/10,
            decoration: BoxDecoration(
              border: Border.all(color: grey),
              shape: BoxShape.circle,
            ),
            child: Text(""),

          )
        ],
      ),
      elevation: 0,
    );
  }
}
