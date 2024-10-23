import 'package:flutter/material.dart';
import '../models/pelanggan.dart';

class CustomerDataScreen extends StatelessWidget {
  final List<Pelanggan> customers;

  CustomerDataScreen(this.customers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pelanggan'),
      ),
      body: customers.isEmpty
          ? Center(
              child: Text('Belum ada data pelanggan.'),
            )
          : ListView.builder(
              itemCount: customers.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(customers[i].namaPelanggan),
                subtitle: Text('Kode: ${customers[i].kodePelanggan}'),
              ),
            ),
    );
  }
}
