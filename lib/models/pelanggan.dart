class Pelanggan {
  String kodePelanggan;
  String namaPelanggan;

  Pelanggan({required this.kodePelanggan, required this.namaPelanggan});
}

class Warnet {
  String kodeTransaksi;
  Pelanggan pelanggan;
  String jenisPelanggan;
  DateTime tglMasuk;
  int jamMasuk; // Jam dalam format integer
  int jamKeluar; // Jam dalam format integer
  double tarif;

  Warnet({
    required this.kodeTransaksi,
    required this.pelanggan,
    required this.jenisPelanggan,
    required this.tglMasuk,
    required this.jamMasuk,
    required this.jamKeluar,
    this.tarif = 10000.0,
  });

  // Hitung lama waktu
  int getLama() {
    return jamKeluar - jamMasuk;
  }

  // Kalkulasi diskon dan total bayar
  double getTotalBayar() {
    double total = getLama() * tarif;
    double diskon = 0.0;
    if (jenisPelanggan == "VIP" && getLama() > 2) {
      diskon = total * 0.02;
    } else if (jenisPelanggan == "GOLD" && getLama() > 2) {
      diskon = total * 0.05;
    }
    return total - diskon;
  }
}
