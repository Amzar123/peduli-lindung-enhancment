class MedicalRecord {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  MedicalRecord({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime
  });

  factory MedicalRecord.fromJson(dynamic json) {
    return MedicalRecord(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String
    );
  }
  
  static List<MedicalRecord> medicalFromSnapshot(List snapshot) {
    return snapshot.map((data) {
        return MedicalRecord.fromJson(data);
      }
    ).toList();
  }
}