import 'package:admin_app/controllers/anonces/anonces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../model/anonce/annonce.dart';

class AnnonceImmobilierWaiting extends StatelessWidget {
  final AnounceModel annonce;

  const AnnonceImmobilierWaiting({super.key, required this.annonce});

  @override
  Widget build(BuildContext context) {
    final AnoncesController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //photo + heart icon
          Container(
            height: 225,
            width: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(annonce.url),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.grey[200],
                  shape: const CircleBorder(),
                  elevation: 2,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          //info
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    annonce.title,
                    style: const TextStyle(
                        fontSize: 20, fontFamily: 'Montserrat8'),
                  ),
                  const SizedBox(
                    width: 130,
                  ),
                  Text(
                    '● ${annonce.action}',
                    style: const TextStyle(color: Colors.blue),
                  )
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      '${annonce.numChambre} Chambres  •  ${annonce.surface} m²'),
                ],
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    annonce.adresse,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      controller.decision("refuse", annonce.uid);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                                color: Colors.red, width: 1.2)),
                      ),
                      elevation: null,
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(105, 35)),
                    ),
                    child: const Text(
                      'Refuse',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat5",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  ElevatedButton(
                    onPressed: () {
                      controller.decision("accept", annonce.uid);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                                color: Colors.green, width: 1.2)),
                      ),
                      elevation: null,
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(105, 35)),
                    ),
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat5",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
