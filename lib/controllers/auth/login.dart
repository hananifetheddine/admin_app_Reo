import 'package:admin_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:admin_app/services/auth/auth.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class LoginController extends GetxController
{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();

  final validatorEmail = ValidationBuilder().email() .required().build();
  final validatorPassword = ValidationBuilder().required().minLength(8).maxLength(30).build();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if(formKey.currentState!.validate()){
      var res = await AuthService.login(emailController.text, passwordController.text); 
      if(res.error){
        Get.snackbar(
          'Erreur',
          'La connexion a échoué. Veuillez réessayer.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }else{

        Get.to(const HomeViewAgent());
        // go to home
      }
    }

    btnController.stop();
  }


}