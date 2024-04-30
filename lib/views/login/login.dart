import 'package:admin_app/controllers/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:admin_app/views/components/animated_button.dart';
import 'package:admin_app/views/components/text_field.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';


class LoginViewAgent extends StatelessWidget {
  LoginViewAgent({super.key});

  final LoginController myController = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0 ,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              Form(
                key: myController.formKey,
                child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  [
          
          
                    //Admin mail
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,                    
                      children: [
                        const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 8,),
                          child:  Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.black,
                              // fontFamily: "Gilroy-Meduim",
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        InputComponent(
                          controller: myController.emailController,
                          type: TextInputType.emailAddress,
                          onSubmit: (value) {},
                          onChange: (value) {},
                          validate: myController.validatorEmail,
                        ),  
                      ],
                    ),
                    
                    
                    const SizedBox(height: 10.0,),
                    
                    
                    //mot de passe
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 8,),
                          child:  Text(
                            'Mot de passe',
                            style: TextStyle(
                              color: Colors.black,
                              // fontFamily: "Montserrat5",
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        InputComponent(
                          controller: myController.passwordController,
                          onSubmit: (value) {},
                          onChange: (value) {},
                          validate: myController.validatorPassword,
                          showSuffixButton: true,
                        ),
                        ],
                    ),  
                    const SizedBox(height: 20.0,),
        
      
                    //connexion
                    animatedButton(myController.btnController, myController.login, "se connecter"),
                      
                  
                  ],
                )
              ),
            ],
          ),
      ),
    
    );
  }
}

