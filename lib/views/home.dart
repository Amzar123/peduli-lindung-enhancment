import 'package:flutter/material.dart';
import 'package:health_app/views/widgets/medical_record_card.dart';
import 'package:health_app/views/widgets/medrec_card.dart';

import '../models/MedicalRecords.dart';
import '../models/MedicalRecord.api.dart';
import '../models/medical_record_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<MedicalRecord> _medical;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getMedicalRecords() async {
    var records = await MedicalRecordApi.getMedical();
    setState(() {
      _isLoading = false;
    });
    print(records);
  }

  static List<MedicalRecordModel> main_medical_records = [
    MedicalRecordModel(
      'Sakit Punggung',
      'Normal',
      '150/100mmHG',
      '08-05-2022 10:15 WIB',
      'Jl. Raya Kopo No.161, Situsaeur, Kec. Bojongloa Kidul, Kota Bandung, Jawa Barat 40233',
      'RS Imanuel',
    ),
    MedicalRecordModel(
      'Sakit Kepala',
      'Normal',
      '150/100mmHG',
      '08-05-2022 10:15 WIB',
      'Jl. Raya Kopo No.161, Situsaeur, Kec. Bojongloa Kidul, Kota Bandung, Jawa Barat 40233',
      'RS Imanuel',
    ),
    // MedicalRecordModel(),
    // MedicalRecordModel()
  ];

  List<MedicalRecordModel> display_list = List.from(main_medical_records);
  void updateMedicalList(String value) {
    setState(() {
      display_list = main_medical_records.where((element)
          => element.keluhan!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            // floating: true,
            pinned: true,
            leading: Icon(Icons.arrow_back),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onChanged: (value) => updateMedicalList(value),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide.none
                          ),
                          hintText: "Find medical record",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            title: Column(
              children: const [
                Text('Medical Records'),
              ],
            ),
            expandedHeight: 200,
          ),

          display_list.length == 0 ?
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (BuildContext context, index) {
                        return Center(
                          child:
                          Text(
                              'Not Found',
                            style: TextStyle(
                              color: Colors.blueAccent
                            ),
                          )
                        );
                      },
                      childCount: 1
                  ),
              )
              :
          SliverList(
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, index) {
                  return MedRecCard(
                    namaRumahSakit: display_list[index].namaRumahSakit,
                    waktuPemeriksaan: display_list[index].waktuPemeriksaan,
                    keluhan: display_list[index].keluhan,
                    tekananDarah: display_list[index].tekananDarah,
                    status: display_list[index].status,
                    alamatRumahSakit: display_list[index].alamatRumahSakit,
                  );
                },
                childCount: display_list.length
              ),
          ),
        ],
      )
    );
  }
}