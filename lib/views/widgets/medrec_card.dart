import 'package:flutter/material.dart';

import '../detail_medical_record.dart';

class MedRecCard extends StatelessWidget {
  final String keluhan;
  final String namaRumahSakit;
  final String alamatRumahSakit;
  final String waktuPemeriksaan;
  final String tekananDarah;
  final String status;

  const MedRecCard({super.key,
    required this.keluhan,
    required this.namaRumahSakit,
    required this.alamatRumahSakit,
    required this.waktuPemeriksaan,
    required this.tekananDarah,
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
        child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => DetailMedicalPage(keluhan: keluhan)
                  )
              );
            },
            child: Container(
              color: Colors.white,
              child: SizedBox(
                  height: 160,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                            child: Text(
                              keluhan,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          )
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Row(
                              children: [
                                Icon(Icons.local_hospital),
                                Text(
                                  namaRumahSakit,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15
                                  ),
                                ),
                              ],
                            )
                          )
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Text(
                              alamatRumahSakit,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15
                              ),
                            ),
                          )
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    '$waktuPemeriksaan   |   ',
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12
                                    ),
                                  ),
                                  Text(
                                    '$tekananDarah   |',
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12
                                    ),
                                  ),
                                  Text(
                                    '   $status',
                                    style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12
                                    ),
                                  )
                                ],
                              )
                          )
                      )
                    ],
                  )
              ),
            )
        )
    );
  }
}