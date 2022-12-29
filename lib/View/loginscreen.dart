import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/login_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formkey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();

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
                        SizedBox(height: 5),
                        buildTextFormField("Enter Your Email",emailcontroller),
                        SizedBox(height: 5),

                        buildTextFormField("Enter Your Password",passwordController),
                        ElevatedButton(
                            onPressed: (){
                              if(!formkey.currentState!.validate()){
                                Get.snackbar("Login Failed", "all fields are required");
                              }else {
                                getXHelper.userLogin(emailcontroller.text, passwordController.text);


                              }
                            },
                            child: Text("Login")
                        )
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
