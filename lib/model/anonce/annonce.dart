import 'package:cloud_firestore/cloud_firestore.dart';

class AnounceModel {
  String title;
  String description;
  String wilaya;
  String adresse;
  String type;
  String numChambre;
  String surface;
  String action;
  String url;
  String state;
  String uid;
  String uidPublisher;
  String phonePublisher;
  String fullNamePublisher;

  AnounceModel(
      {required this.title,
      required this.description,
      required this.wilaya,
      required this.adresse,
      required this.type,
      required this.numChambre,
      required this.surface,
      required this.url,
      required this.state,
      required this.action,
      required this.uid,
      required this.uidPublisher,
      required this.phonePublisher,
      required this.fullNamePublisher});

  factory AnounceModel.fromMap(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return AnounceModel(
        title: data['title'],
        description: data['description'],
        wilaya: data['wilaya'],
        adresse: data['adresse'],
        type: data['type'],
        numChambre: data['num_chambre'].toString(),
        surface: data['surface'].toString(),
        url: data["url"],
        state: data["state"],
        action: data["action"],
        uid: data["uid"],
        uidPublisher: data["uid_publisher"] ?? "",
        phonePublisher: data["phone_publisher"] ?? "",
        fullNamePublisher: data["full_name_publisher"] ?? "");
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'wilaya': wilaya,
      'adresse': adresse,
      'type': type,
      'num_chambre': numChambre,
      'surface': surface,
      'url': url,
      'uid': uid,
      'state': 'demande',
      'action': action,
      "phone_publisher": phonePublisher,
      "full_name_publisher": fullNamePublisher,
      "uidPublisher": uidPublisher,
    };
  }

  @override
  String toString() {
    return 'AnounceModel{'
        'title: $title, '
        'description: $description, '
        'wilaya: $wilaya, '
        'adresse: $adresse, '
        'type: $type, '
        'numChambre: $numChambre, '
        'surface: $surface, '
        'action: $action, '
        'url: $url, '
        'state: $state}';
  }
}
