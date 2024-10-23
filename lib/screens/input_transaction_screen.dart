import 'package:flutter/material.dart';
import 'dart:math';
import '../models/pelanggan.dart';
import '../widgets/main_drawer.dart'; // Import Drawer

class InputTransactionScreen extends StatefulWidget {
  final Function addCustomer; // Fungsi untuk menambah pelanggan baru

  InputTransactionScreen(this.addCustomer);

  @override
  _InputTransactionScreenState createState() => _InputTransactionScreenState();
}

class _InputTransactionScreenState extends State<InputTransactionScreen> {
  final _namaPelangganController = TextEditingController();
  String _jenisPelanggan = 'Umum';
  int _jamMasuk = 0;
  int _jamKeluar = 0;
  double _totalBayar = 0.0;
  String _kodePelanggan = '';
  String _kodeTransaksi = '';

  void _generateRandomKode() {
    final random = Random();
    _kodePelanggan = 'P${random.nextInt(10000)}';
    _kodeTransaksi = 'T${random.nextInt(10000)}';
  }

  void _calculateTotal() {
    DateTime now = DateTime.now();
    _generateRandomKode();

    Pelanggan pelanggan = Pelanggan(
      kodePelanggan: _kodePelanggan,
      namaPelanggan: _namaPelangganController.text,
    );

    // Menambah pelanggan ke list melalui fungsi yang dikirimkan
    widget.addCustomer(pelanggan);

    Warnet warnet = Warnet(
      kodeTransaksi: _kodeTransaksi,
      pelanggan: pelanggan,
      jenisPelanggan: _jenisPelanggan,
      tglMasuk: now,
      jamMasuk: _jamMasuk,
      jamKeluar: _jamKeluar,
    );

    setState(() {
      _totalBayar = warnet.getTotalBayar();
    });

    // Pindah ke halaman data pelanggan setelah input berhasil
    Navigator.of(context).pushNamed('/customer-data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Transaksi'),
      ),
      drawer: MainDrawer(), // Tambahkan Drawer di sini
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Pelanggan:'),
            TextField(
              controller: _namaPelangganController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text('Jenis Pelanggan:'),
            DropdownButtonFormField<String>(
              value: _jenisPelanggan,
              items: [
                DropdownMenuItem(child: Text('Umum'), value: 'Umum'),
                DropdownMenuItem(child: Text('VIP'), value: 'VIP'),
                DropdownMenuItem(child: Text('GOLD'), value: 'GOLD'),
              ],
              onChanged: (value) {
                setState(() {
                  _jenisPelanggan = value!;
                });
              },
            ),
            SizedBox(height: 16),
            Text('Jam Masuk (0-23):'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _jamMasuk = int.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 16),
            Text('Jam Keluar (0-23):'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _jamKeluar = int.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _calculateTotal,
                child: Text('Hitung Total', style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total Bayar: Rp ${_totalBayar.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
