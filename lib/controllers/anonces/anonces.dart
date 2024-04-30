import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/anonce/annonce.dart';
import '../../model/general/general.dart';
import '../../services/anonces/anonce.dart';

class AnoncesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<AnounceModel> announces = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    getAnnonces();
  }

  RxBool fetchingData = false.obs;
  Future getAnnonces() async {
    fetchingData.value = true;
    var res = await AnnonceService.getAnnonces();
    if (!res.error) {
      announces = res.data;
    } else {
      // afficher message
    }
    fetchingData.value = false;
  }

  List<AnounceModel> getCurrent(String state) {
    return announces.where((element) => element.state == state).toList();
  }

  void decision(String s, String uid) async {
    String decision = s == "accept" ? "accept" : "refuse";
    var res = await AnnonceService.decision(decision, uid);
    if (res.error) {
      //afficher message
    } else {
      //afficher message
      getAnnonces();
    }
  }
}
