import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Input Transaksi'),
            onTap: () {
              Navigator.of(context).pushNamed('/input-transaction');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Data Pelanggan'),
            onTap: () {
              Navigator.of(context).pushNamed('/customer-data');
            },
          ),
        ],
      ),
    );
  }
}
