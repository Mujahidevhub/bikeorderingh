import 'package:get/get.dart';

import '../Model/usermodel.dart';
import '../View/selectyourbike.dart';

class GetXHelper extends GetxController{
  List<UserModel?> usersList = [];
   UserModel? currentUser ;




  userSignup(UserModel userData){

    print('previousUsers = ${usersList.map((e) => e!.useremail)}');

    ///For checkin userphone
    if(usersList.firstWhere((element) => element!.userphone == userData.userphone,orElse: ()=>null) != null){

      Get.snackbar('Error', 'Phone already exist');

    }
    ///For checkin user email
    else if(usersList.firstWhere((element) => element!.useremail == userData.useremail,orElse: ()=>null) != null){
      Get.snackbar('Error', 'Email already exist');
    }
    ///if all unique login
    else{

      ///adding unique user to userslist
      usersList.add(userData);

      /// setting currentuser
      currentUser = userData;

      /// update getx controllers;
      update();

      Get.to(SelectYourBike());
      Get.snackbar("Login Successfully", "Welcome to Catalog",
       );
    }


  }

  userLogin(String email,String password){

    print('previousUsers = ${usersList.map((e) => e!.useremail)}');


    ///For checkin user email
     if(usersList.firstWhere((element) => element!.useremail == email,orElse: ()=>null) == null){
      Get.snackbar('Error', 'Email not found');
    }
     else if(usersList.firstWhere((element) => element!.useremail == email,orElse: ()=>null)!.password != password){
       Get.snackbar('Error', 'Password Incorrect');

     }
    ///if all unique login
    else{
      /// setting currentuser
      currentUser = usersList.firstWhere((element) => element!.useremail == email,orElse: ()=>null)!;

      /// update getx controllers;
      update();

      Get.to(SelectYourBike());
      Get.snackbar("Login Successfully", "Welcome to Catalog",
      );
    }


  }


}
