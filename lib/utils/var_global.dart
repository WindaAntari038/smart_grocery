class VarGlobal {
  static List<Map<String, dynamic>> keranjang = [];
  static List<Map<String, dynamic>> riwayatBelanja = [];

  static void tambahRiwayatBelanja(Map<String, dynamic> riwayat) {
    riwayatBelanja.add(riwayat);
  }
}
