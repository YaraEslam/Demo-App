
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/models/category_model.dart';
import 'package:untitled/app/models/item_model.dart';

class HomePageController extends GetxController {

  TextEditingController searchController = TextEditingController();
  List<CategoryData> categoryList = [];
  List<ItemData> itemList = [];
  double totalPrice = 0;

  @override
  onInit()async{
    super.onInit();
    getCategories();
    getItems();
  }

  getCategories(){
    categoryList = [
      CategoryData(color: const Color(0xffF9BDAD),title: "Steak"),
      CategoryData(color: const Color(0xffFAD96D),title: "Vegetables"),
      CategoryData(color: const Color(0xffCCB8FF),title: "Beverages"),
      CategoryData(color: const Color(0xffB0EAFD),title: "Fish"),
      CategoryData(color: const Color(0xffFF9DC2),title: "Juice"),
      CategoryData(color: const Color(0xffF9BDAD),title: "other"),
    ];
    update();
  }

  getItems(){
    itemList = [
      ItemData(color: Color(0xffFBEDD8),added: false,location: "15 Minutes Away",
          name: "Summer Sun Ice Cream Pack",description: "Pieces 5", price: "12", priceOld: "15", quantity:0 ),
      ItemData(color: Color(0xffB0EAFD),added: false,location: "15 Minutes Away",
          name: "Salmon",description: "2 Serving", price: "30", priceOld: "50", quantity:0 ),
      ItemData(color: Color(0xffFF9DC2),added: false,location: "15 Minutes Away",
          name: "Red Juice",description: "1 Bottle", price: "25", priceOld: "30", quantity:0 ),
      ItemData(color: Color(0xffCCB8FF),added: false,location: "15 Minutes Away",
          name: "Cola",description: "1 Bottle", price: "11", priceOld: "15", quantity:0 ),
      ItemData(color: Color(0xffF9BDAD),added: false,location: "15 Minutes Away",
          name: "Turkish Steak",description: "173 Grams", price: "25", priceOld: "50", quantity:0 ),
      ItemData(color: Color(0xffFBEDD8),added: false,location: "15 Minutes Away",
          name: "Summer Sun Ice Cream Pack",description: "Pieces 5", price: "12", priceOld: "15", quantity:0 ),
      ItemData(color: Color(0xffB0EAFD),added: false,location: "15 Minutes Away",
          name: "Salmon",description: "2 Serving", price: "30", priceOld: "50", quantity:0 ),
      ItemData(color: Color(0xffFF9DC2),added: false,location: "15 Minutes Away",
          name: "Red Juice",description: "1 Bottle", price: "25", priceOld: "30", quantity:0 ),
      ItemData(color: Color(0xffCCB8FF),added: false,location: "15 Minutes Away",
          name: "Cola",description: "1 Bottle", price: "11", priceOld: "15", quantity:0 ),
      ItemData(color: Color(0xffF9BDAD),added: false,location: "15 Minutes Away",
          name: "Turkish Steak",description: "173 Grams", price: "25", priceOld: "50", quantity:0 ),
      ItemData(color: Color(0xffFBEDD8),added: false,location: "15 Minutes Away",
          name: "Summer Sun Ice Cream Pack",description: "Pieces 5", price: "12", priceOld: "15", quantity:0 ),
      ItemData(color: Color(0xffB0EAFD),added: false,location: "15 Minutes Away",
          name: "Salmon",description: "2 Serving", price: "30", priceOld: "50", quantity:0 ),
      ItemData(color: Color(0xffFF9DC2),added: false,location: "15 Minutes Away",
          name: "Red Juice",description: "1 Bottle", price: "25", priceOld: "30", quantity:0 ),
      ItemData(color: Color(0xffCCB8FF),added: false,location: "15 Minutes Away",
          name: "Cola",description: "1 Bottle", price: "11", priceOld: "15", quantity:0 ),
      ItemData(color: Color(0xffF9BDAD),added: false,location: "15 Minutes Away",
          name: "Turkish Steak",description: "173 Grams", price: "25", priceOld: "50", quantity:0 ),
      ItemData(color: Color(0xffFBEDD8),added: false,location: "15 Minutes Away",
          name: "Summer Sun Ice Cream Pack",description: "Pieces 5", price: "12", priceOld: "15", quantity:0 ),
      ItemData(color: Color(0xffB0EAFD),added: false,location: "15 Minutes Away",
          name: "Salmon",description: "2 Serving", price: "30", priceOld: "50", quantity:0 ),
      ItemData(color: Color(0xffFF9DC2),added: false,location: "15 Minutes Away",
          name: "Red Juice",description: "1 Bottle", price: "25", priceOld: "30", quantity:0 ),
      ItemData(color: Color(0xffCCB8FF),added: false,location: "15 Minutes Away",
          name: "Cola",description: "1 Bottle", price: "11", priceOld: "15", quantity:0 ),
      ItemData(color: Color(0xffF9BDAD),added: false,location: "15 Minutes Away",
          name: "Turkish Steak",description: "173 Grams", price: "25", priceOld: "50", quantity:0 ),
    ];
    update();
  }

  added(int index){
    itemList[index].added= !itemList[index].added!;
    if(itemList[index].added!) {
      itemList[index].quantity = 1;
      totalPrice += double.parse(itemList[index].price!);
    }else{
      itemList[index].quantity = 0;
      totalPrice -= double.parse(itemList[index].price!);
    }
    update();

  }

}
