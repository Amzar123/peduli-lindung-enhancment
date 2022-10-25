import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailMedicalPage extends StatelessWidget {
  final String keluhan;

  const DetailMedicalPage({super.key,
    required this.keluhan
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical Record"),
      ),
    );
  }
}