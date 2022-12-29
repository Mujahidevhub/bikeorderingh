import 'package:bikeordering/Controllers/login_controller.dart';
import 'package:bikeordering/Controllers/selectbikecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'selectyourbike.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key, this.images}) : super(key: key);
final  images;
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<GetXHelper>(
        init: Get.put(GetXHelper()),
        builder: (authController) {
          return GetBuilder<SelectBikeController>(
            init: Get.put(SelectBikeController()),
            builder: (bikeController) {
              return Scaffold(

                appBar: AppBar(
                  centerTitle: true,
                  title: Text("CART"),
                ),
                body:Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                           itemCount: bikeController.bikeList.length,
                           itemBuilder: (BuildContext context, int index){
                            return
                              Column(
                              children: [
                                Image.asset(bikeController.bikeList[index]),
                                SizedBox(height: 2,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      bikeController.removeBiketocart(bikeController.bikeList[index]);
                                    });
                                    Get.snackbar("Item Status","Item Removed Successfully");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Text('Remove from cart'),
                                      Icon(Icons.delete,color: Colors.red,)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,)
                              ],
                            );
                          },
                        ),
                      ),
                      ElevatedButton(onPressed: (){
                        showDialog(
                            context: context,
                            builder: (userdeatils) => AlertDialog(

                              content: Container(
                                height: 200,
                                child: Column(
                                  children: [
                                    Text(authController.currentUser!.username),
                                    Text(authController.currentUser!.userphone),
                                    Text(authController.currentUser!.useremail),
                                    ElevatedButton(onPressed: (){

                                      Get.offAll(SelectYourBike());
                                      Get.snackbar('Success', 'Order Recieved');

                                    }, child: Text('Continue'))
                                  ],
                                ),
                              ),
                            )
                        );
                      }, child: Text("Checkout")
                      ),
                    ],
                  ),
                ),
              );
            }
          );
        }
      ),

    );
  }

  Container buildTextButton(String itemscount) {
    return Container(
      height: 30,width: 30,
        child: Card(
            color: Colors.blueGrey,
            child: Center(child: Text(itemscount,style: TextStyle(color: Colors.white),))),

    );

  }
}
