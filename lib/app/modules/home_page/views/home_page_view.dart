
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:untitled/app/models/category_model.dart';
import 'package:untitled/app/models/item_model.dart';
import '../../../../common/color.dart';
import '../../../../common/ui.dart';
import '../controllers/home_page_controller.dart';


class HomePageView extends GetView<HomePageController> {
   HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              Ui.appBar("Mustafa St."),
              TextField(
                controller: controller.searchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: grey3,
                    ),
                  ),
                  hintText: "Search in thousands of products",
                  filled: true,
                  fillColor: grey2,
                  prefixIcon: Icon(Icons.search)
                ),
              ).paddingSymmetric(horizontal: 16, vertical: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  item1("Home Address", "Mustafa St. No:2", "Street x12"),
                  item1("Office Address", "Axis Istanbul, B2 Blok", "Floor 2, Office 11"),
                ],
              ).paddingSymmetric(horizontal: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Explore by Category", style: Ui.textStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16),),
                  Text("See All", style: Ui.textStyle.copyWith( fontSize: 16, color: grey4),),
                ],
              ).paddingSymmetric(horizontal: 16, vertical: 16),
              GetBuilder<HomePageController>(
                init: HomePageController(),
                builder: (controller) {
                  return SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(controller.categoryList.length, (index) => itemRow(controller.categoryList[index])),
                    ),
                  );
                }
              ),
              Text("Deals of the day", style: Ui.textStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16),)
                  .paddingSymmetric(horizontal: 16, vertical: 16),


              SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: GetBuilder<HomePageController>(
                  init: HomePageController(),
                  builder: (context) {
                    return Row(
                      children: List.generate(controller.itemList.length, (index) =>
                          dealsItem(controller.itemList[index], index)),
                    );
                  }
                ),
              ),

              Container(
                width: MediaQuery.of(Get.context!).size.width,
                height: MediaQuery.of(Get.context!).size.width/3,
                decoration: BoxDecoration(
                  color: Color(0xffFEC8BD),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    SizedBox(width: MediaQuery.of(Get.context!).size.width/3,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mega", style: Ui.textStyle.copyWith(color: orange),),
                        RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "WHOPP", style: Ui.textStyle.copyWith(color: logoColor, fontWeight: FontWeight.bold,
                                fontSize: 20)),
                            TextSpan(text: "E", style: Ui.textStyle.copyWith(color: orange, fontWeight: FontWeight.bold,
                                fontSize: 20)),
                            TextSpan(text: "R", style: Ui.textStyle.copyWith(color: logoColor, fontWeight: FontWeight.bold,
                                fontSize: 20)),
                          ]
                        )),
                        Row(
                          children: [
                            Text("\$ 17", style: Ui.textStyle.copyWith(color: orange, fontSize: 12,
                                fontWeight: FontWeight.w900),),
                            SizedBox(width: 20,),
                            Stack(
                              children: [
                                Text("\$ 33", style: Ui.textStyle.copyWith(color: white),),
                                Positioned(
                                  top: 7,
                                  bottom: 7,
                                  child: Container(
                                    width: 30,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: white,
                                    ),
                                    child: Text(""),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ).paddingSymmetric(vertical: 16),
                        Text("* Available until 24 December 2020", style: Ui.textStyle.copyWith(color: white),),
                      ],
                    ),
                  ],
                ),
              ).paddingSymmetric(vertical: 16, horizontal: 16),
              SizedBox(height: 100,)
            ],
          )
      ),
    );
  }


  item1(String title, String address1, String address2){
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(Get.context!).size.width/2.2,
      decoration: BoxDecoration(
        border: Border.all(color: grey3,),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(Get.context!).size.width/10,
            height: MediaQuery.of(Get.context!).size.width/10,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xffD7D7D7)
            ),
            child: Text(""),
          ),
          SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Ui.textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold),),
              Text(address1, style: Ui.textStyle.copyWith(fontSize: 11)),
              Text(address2, style: Ui.textStyle.copyWith(fontSize: 11)),
            ],
          )
        ],
      ),
    );
  }

  itemRow(CategoryData categoryData){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(Get.context!).size.width/6,
          height: MediaQuery.of(Get.context!).size.width/6,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: categoryData.color
          ),
          child: Text(""),
        ),
        SizedBox(height: 16,),
        Text(categoryData.title!, style: Ui.textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500),)
      ],
    ).paddingSymmetric(horizontal: 8);
  }

   dealsItem(ItemData itemData, int index){
     return Row(
       children: [
         Stack(
           children: [
             Container(
               width: MediaQuery.of(Get.context!).size.width/3.5,
               height: MediaQuery.of(Get.context!).size.width/3.5,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(8)),
                   color: itemData.color
               ),
               child: Text(""),
             ),
             GetBuilder<HomePageController>(
               init: HomePageController(),
               builder: (controller) {
                 return Container(
                   width: MediaQuery.of(Get.context!).size.width/15,
                   height: MediaQuery.of(Get.context!).size.width/15,
                   decoration: const BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(8)),
                       color: white
                   ),
                   child: InkWell(
                     onTap: (){
                       controller.added(index);
                     },
                     child: Center(
                       child: itemData.added!?const Icon(MdiIcons.heart, color: Colors.red):
                       Icon(MdiIcons.heartOutline, color: null),
                     ),
                   ),
                 );
               }
             ),

           ],
         ),
         SizedBox(width: 16,),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(itemData.name!, style: Ui.textStyle.copyWith(fontSize: 11,
                 fontWeight: FontWeight.bold),).paddingSymmetric(vertical: 8),
             Text(itemData.description!, style: Ui.textStyle.copyWith(fontSize: 9)).paddingSymmetric(vertical: 8),
             Row(
               children: [
                 Icon(Icons.location_on, color: grey,),
                 Text(itemData.location!, style: Ui.textStyle.copyWith(fontSize: 12, color: grey)).paddingSymmetric(vertical: 8),
               ],
             ),
             Row(
               children: [
                 Text("\$ ${itemData.price!}", style: Ui.textStyle.copyWith(color: orange, fontSize: 12,
                     fontWeight: FontWeight.w900),),
                 SizedBox(width: 20,),
                 Stack(
                   children: [
                     Text("\$ ${itemData.priceOld!}", style: Ui.textStyle.copyWith(color: grey),),
                     Positioned(
                       top: 7,
                       bottom: 7,
                       child: Container(
                         width: 30,
                         height: 1,
                         decoration: BoxDecoration(
                           color: grey,
                         ),
                         child: Text(""),
                       ),
                     )
                   ],
                 ),
               ],
             ).paddingSymmetric(vertical: 8),
           ],
         )
       ],
     ).paddingSymmetric(horizontal: 16);
   }
}