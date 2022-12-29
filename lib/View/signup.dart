import 'package:bikeordering/Model/usermodel.dart';
import 'package:bikeordering/View/loginscreen.dart';
import 'package:bikeordering/View/selectyourbike.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/login_controller.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  
  final formkey = GlobalKey<FormState>();
  
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GetXHelper getXHelper = Get.put(GetXHelper());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
         ),
        body: Padding(
          padding:   EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  shadowColor: Colors.indigo,
                  child: Padding(
                    padding:   EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        buildTextFormField("Enter Your Name",emailcontroller),
                        SizedBox(height: 5),
                        buildTextFormField("Enter Phone Number",phonecontroller),
                        SizedBox(height: 5),
                        buildTextFormField("Enter Your Email",usercontroller),
                        SizedBox(height: 5),

                        buildTextFormField("Enter Your Password",passwordController),
                        ElevatedButton(
                            onPressed: (){
                              if(emailcontroller.text.isEmpty &&
                                 phonecontroller.text.isEmpty &&
                                 usercontroller.text.isEmpty && !formkey.currentState!.validate()){
                                Get.snackbar("Login Failed", "all fields are required");
                              }else {
                                getXHelper.userSignup(UserModel(emailcontroller.text, usercontroller.text, phonecontroller.text,emailcontroller.text, passwordController.text,));


                              }
                            },
                            child: Text("Signup")
                        ),

                        InkWell(
                            onTap: (){
                              Get.offAll(Login());
                            },
                            child: Text('Already Have an account: Click here to Login'))
                      ],
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


  TextFormField buildTextFormField(String lbltxt, textcontroller) {
    return TextFormField(
      controller:  textcontroller,
                      obscureText: lbltxt == 'Enter Your Password',
                      decoration: InputDecoration(
                          labelText: lbltxt,
                      ),
      validator: (value){
        if(value!.isEmpty){
          return lbltxt + 'is required';
        }
        return null;
      },
                    );
  }
}
