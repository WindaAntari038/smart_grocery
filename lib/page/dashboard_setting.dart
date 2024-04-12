import 'package:flutter/material.dart';
import 'package:apk1/page/profile.dart'; // Import halaman profil

class DashboardSetting extends StatefulWidget {
  const DashboardSetting({Key? key}) : super(key: key);

  @override
  State<DashboardSetting> createState() => _DashboardSettingState();
}

class _DashboardSettingState extends State<DashboardSetting> {
  void _goToProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background warna putih bersih
      body: ListView(
        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 32.0), // Atur padding container
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 100, 166, 247),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: const Text(
                'Informasi Profile',
                style: TextStyle(fontSize: 20.0), // Perbesar ukuran teks
              ),
              subtitle: const Text(
                'Lihat dan ubah informasi profil Anda',
                style: TextStyle(fontSize: 16.0), // Perbesar ukuran teks
              ),
              leading: Icon(
                Icons.person,
                size: 30.0, // Perbesar ukuran ikon
              ),
              onTap: _goToProfilePage, // Mengarahkan ke halaman profil
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 100, 166, 247),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: const Text(
                'Data Pengguna',
                style: TextStyle(fontSize: 20.0), // Perbesar ukuran teks
              ),
              subtitle: const Text(
                'Kelola data pengguna Anda',
                style: TextStyle(fontSize: 16.0), // Perbesar ukuran teks
              ),
              leading: Icon(
                Icons.data_usage,
                size: 30.0, // Perbesar ukuran ikon
              ),
              onTap: () {
                // Implementasi untuk menampilkan dan mengelola data pengguna
              },
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 100, 166, 247),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: const Text(
                'Pengaturan',
                style: TextStyle(fontSize: 20.0), // Perbesar ukuran teks
              ),
              subtitle: const Text(
                'Atur preferensi aplikasi Anda',
                style: TextStyle(fontSize: 16.0), // Perbesar ukuran teks
              ),
              leading: Icon(
                Icons.settings,
                size: 30.0, // Perbesar ukuran ikon
              ),
              onTap: () {
                // Implementasi untuk mengatur pengaturan aplikasi
              },
            ),
          ),
        ],
      ),
    );
  }
}
