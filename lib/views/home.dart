import 'package:admin_app/views/components/image_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'anonces/anonces.dart';

class HomeViewAgent extends StatelessWidget {
  const HomeViewAgent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Admin Panel',
            style: TextStyle(
                color: Colors.black, fontSize: 18.0, fontFamily: 'Montserrat7'),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              //Gestion des annonces
              CustomImageContainer(
                  imagePath: 'assets/imagetest.png',
                  height: 150,
                  width: 350,
                  onPressed: () {
                    Get.to(() => const AnoncesView());
                  },
                  text: 'Les annonces'),

              //Gestion des demandes de visites
              CustomImageContainer(
                  imagePath: 'assets/imagetest.png',
                  height: 150,
                  width: 350,
                  onPressed: () {},
                  text: 'Les demandes visites'),

              //support client
              CustomImageContainer(
                  imagePath: 'assets/imagetest.png',
                  height: 150,
                  width: 350,
                  onPressed: () {},
                  text: 'Messagerie'),

              //infos utilisateurs
              CustomImageContainer(
                  imagePath: 'assets/imagetest.png',
                  height: 150,
                  width: 350,
                  onPressed: () {},
                  text: 'Infos utilisateurs')
            ],
          ),
        ));
  }
}
