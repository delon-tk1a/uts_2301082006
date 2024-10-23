import 'package:flutter/material.dart';
import 'screens/input_transaction_screen.dart';
import 'screens/customer_data_screen.dart';
import 'models/pelanggan.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Daftar pelanggan yang sudah mengisi form
  final List<Pelanggan> _customers = [];

  // Fungsi untuk menambah pelanggan baru
  void _addNewCustomer(Pelanggan customer) {
    setState(() {
      _customers.add(customer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warnet App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
        ),
      ),
      // Pastikan untuk mengirim daftar pelanggan dan fungsi tambah pelanggan ke halaman lain
      home: InputTransactionScreen(_addNewCustomer),
      routes: {
        '/input-transaction': (ctx) => InputTransactionScreen(_addNewCustomer),
        '/customer-data': (ctx) => CustomerDataScreen(_customers),
      },
    );
  }
}
