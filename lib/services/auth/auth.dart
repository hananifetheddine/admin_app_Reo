import 'package:admin_app/model/general/general.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
  
  
  
  static Future<General<void>> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return General(data: null, error: false);
    } catch (error) {
      return General(
          data: null, error: true, messageError: "Something went wrong");
    }
  }

  
  // Méthode pour récupérer les données utilisateur à partir de Firestore
  

  //Deconnecter
  Future<void> signOut() async {
    await auth.signOut();
  }
}
