import 'package:admin_app/controllers/anonces/anonces.dart';
import 'package:admin_app/views/anonces/widgets/tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AnoncesView extends StatelessWidget {
  const AnoncesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AnoncesController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: controller.tabController,
          labelStyle: TextStyle(fontSize: 16.0), //For Selected tab
          tabs: [
            Tab(text: "Waiting"),
            Tab(text: "Accepted"),
          ],
        ),
        centerTitle: true,
        title: Text(
          'Tabs Demo',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontFamily: "Montserrat7",
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          TabBarCustomView(state: "demande"),
          TabBarCustomView(state: "accept"),
        ],
      ),
    ));
  }
}
