import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/anonces/anonces.dart';
import '../../../services/anonces/components/anonce.dart';

class TabBarCustomView extends StatelessWidget {
  const TabBarCustomView({super.key, required this.state});

  final String state;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AnoncesController>();
    return Obx(
      () => controller.fetchingData.isTrue
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: controller.getAnnonces,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                itemCount: controller.getCurrent(state).length,
                itemBuilder: (_, index) => state == "demande"
                    ? AnnonceImmobilierWaiting(
                        annonce: controller.getCurrent(state)[index])
                    : SizedBox(),
                separatorBuilder: (_, __) => SizedBox(height: 2.h),
              ),
            ),
    );
  }
}
