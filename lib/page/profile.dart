// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/userx.png'), // Ganti dengan path gambar pengguna
                ),
                SizedBox(height: 16.0),
                Text(
                  'Nama Panggilan',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'email@example.com',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                SizedBox(height: 8.0),
                Text(
                  '+62 123 4567 890',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                SizedBox(height: 16.0),
                Divider(),
                ListTile(
                  title: Text('Informasi Lainnya'),
                ),
                ListTile(
                  title: Text('Alamat'),
                  subtitle: Text('Jl. Contoh No. 123'),
                ),
                ListTile(
                  title: Text('Kota'),
                  subtitle: Text('Kota Contoh'),
                ),
                ListTile(
                  title: Text('Negara'),
                  subtitle: Text('Negara Contoh'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
