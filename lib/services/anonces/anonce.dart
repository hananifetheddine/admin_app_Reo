import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/anonce/annonce.dart';
import '../../model/general/general.dart';

class AnnonceService {
  static CollectionReference annoncesCollection =
      FirebaseFirestore.instance.collection("annonce");

  //static var docCollection = FirebaseFirestore.instance.collection("annonce").doc(FirebaseAuth.instance.////currentUser!.uid);

  static Future<General<List<AnounceModel>>> getAnnonces() async {
    try {
      var res = await annoncesCollection.get();
      List<AnounceModel> announces =
          res.docs.map((e) => AnounceModel.fromMap(e)).toList();

      return General(data: announces);
    } catch (error) {
      return General(
          data: [], error: true, messageError: "Something went wrong");
    }
  }

  static Future<General<String>> addPic(String path) async {
    try {
      var date = DateTime.now().toString();

      var ref = FirebaseStorage.instance.ref("images/anonces/$date.jpg");

      await ref.putFile(File(path));

      var url = await ref.getDownloadURL();
      return General(data: url);
    } on FirebaseException catch (e) {
      return General(data: e.toString(), error: true);
    }
  }

  static Future<General<void>> addAnnounce(AnounceModel announceModel) async {
    try {
      await annoncesCollection
          .doc(announceModel.uid)
          .set(announceModel.toFirestore());
      return General(data: null);
    } catch (e) {
      return General(data: null, error: true);
    }
  }

  static Future<General<void>> decision(String decision, String uid) async {
    try {
      await annoncesCollection.doc(uid).update({"state": decision});
      return General(data: null);
    } catch (e) {
      return General(data: null, error: true);
    }
  }
}
