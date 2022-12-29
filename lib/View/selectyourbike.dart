import 'package:bikeordering/Controllers/login_controller.dart';
import 'package:bikeordering/Controllers/selectbikecontroller.dart';
import 'package:bikeordering/View/checkoutscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SelectYourBike extends StatefulWidget {
  const SelectYourBike({Key? key}) : super(key: key);

  @override
  State<SelectYourBike> createState() => _SelectYourBikeState();
}


class _SelectYourBikeState extends State<SelectYourBike> {




  Future<bool> onwillpop()async{
    return false;
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: WillPopScope(
        onWillPop:   onwillpop,
        child: GetBuilder<GetXHelper>(
          init: Get.put(GetXHelper()),
          builder: (authcontroller) {
            return GetBuilder<SelectBikeController>(
              init: Get.put(SelectBikeController()),
              builder: (bikeController) {
                return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                     centerTitle: true,
                    title: Text("Choose Your Bike"),
                    actions: [
                      Stack(
                        children:[
                          IconButton(
                          icon :Icon(Icons.shopping_cart),
                          onPressed: () {
                            Get.to(CheckoutScreen());},
                        ),
                          Padding(
                            padding:   EdgeInsets.only(top: 8.0,left: 25),
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.red,
                              child:Center(
                              child: Text(
                                '${bikeController.bikeList.length.toString()}',
                                style: TextStyle(fontSize: 10,),
                           ),
                             ),
                               ),
                          )
                        ]
                      )
                    ],
                  ),
                  body: Container(
                      padding: EdgeInsets.all(12.0),
                      child: GridView.builder(
                        itemCount: bikeController.images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0
                        ),
                        itemBuilder: (BuildContext context, int index){
                          return
                              Column(
                                children: [
                                 Image.asset(bikeController.images[index],height: 100,),
                                  Text("Bike"),
                                  ElevatedButton(onPressed: (){

                                    bikeController.bikeList.contains(bikeController.images[index]) ? bikeController.removeBiketocart(bikeController.images[index]) :     bikeController.addBiketocart(bikeController.images[index]);

                          }, child: Text(bikeController.bikeList.contains(bikeController.images[index]) ? "Remove": "ADD")

                                  )
                                ],

                          );
                        },
                      ),
                  ),
                );
              }
            );
          }
        ),
      )
    );
  }
 }
