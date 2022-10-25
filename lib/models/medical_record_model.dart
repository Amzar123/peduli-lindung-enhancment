class MedicalRecordModel {
  String namaRumahSakit;
  String waktuPemeriksaan;
  String keluhan;
  String tekananDarah;
  String status;
  String alamatRumahSakit;

  MedicalRecordModel(
      this.keluhan,
      this.status,
      this.tekananDarah,
      this.waktuPemeriksaan,
      this.alamatRumahSakit,
      this.namaRumahSakit
      );
}