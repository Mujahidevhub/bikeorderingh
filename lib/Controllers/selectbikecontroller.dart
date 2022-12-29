import 'package:get/get.dart';

class SelectBikeController extends GetxController{
  List<String> images =[
    "assets/bike1.jpg", "assets/bike2.jpg", "assets/bike3.jpg",
    "assets/bike4.jpg", "assets/bike5.jpg", "assets/bike6.jpg",
    "assets/bike1.jpg", "assets/bike2.jpg", "assets/bike3.jpg",
    "assets/bike4.jpg", "assets/bike5.jpg", "assets/bike6.jpg",
    "assets/bike1.jpg", "assets/bike2.jpg", "assets/bike3.jpg",
    "assets/bike4.jpg",
  ];


  List<String> bikeList = [];

  addBiketocart(String bike){

    if(!bikeList.contains(bike)) bikeList.add(bike);
    update();
  }

  removeBiketocart(String bike){

    if(bikeList.contains(bike)) bikeList.remove(bike);
    update();
  }

}