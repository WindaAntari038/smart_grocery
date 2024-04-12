// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:apk1/utils/var_global.dart';
import 'package:apk1/page/dashboard_purchase.dart';

class DashboardAdd extends StatefulWidget {
  const DashboardAdd({Key? key}) : super(key: key);

  @override
  _DashboardAddState createState() => _DashboardAddState();
}

class _DashboardAddState extends State<DashboardAdd> {
  int totalProduk = 0;
  int totalHarga = 0;
  bool isPurchased = false;

  @override
  void initState() {
    super.initState();
    updateTotal();
  }

  void updateTotal() {
    totalProduk = VarGlobal.keranjang.length;
    totalHarga = 0;
    for (var item in VarGlobal.keranjang) {
      totalHarga += int.parse(item['harga'].replaceAll('Rp. ', '').replaceAll('.', ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (VarGlobal.keranjang.isEmpty)
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Center(
                child: Text('Barang yang akan ditambahkan ada disini'),
              ),
            ),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Produk: $totalProduk'),
                Text('Total Harga: Rp. ${totalHarga.toString()}'),
                if (!isPurchased && VarGlobal.keranjang.isNotEmpty)
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika untuk menampilkan QRIS
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Pembayaran QRIS'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/qris.png'), // Ganti dengan path foto QRIS
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.check),
                                      onPressed: () {
                                        setState(() {
                                          VarGlobal.riwayatBelanja.add({
                                            'tanggal': DateTime.now().toString(),
                                            'barang': VarGlobal.keranjang,
                                            'totalProduk': totalProduk,
                                            'totalBelanja': totalHarga
                                          });
                                          VarGlobal.keranjang.clear();
                                          updateTotal();
                                          isPurchased = true; // Setelah dibeli, ubah status menjadi true
                                        });
                                        Navigator.pop(context); // Tutup dialog QRIS setelah pembelian berhasil
                                      },
                                      color: isPurchased ? Colors.green : null, // Ubah warna ikon jika sudah dibeli
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Kembali'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text('Beli'),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: VarGlobal.keranjang.length,
              itemBuilder: (context, index) {
                return _buildItem(
                  VarGlobal.keranjang[index]['title'],
                  VarGlobal.keranjang[index]['harga'],
                  VarGlobal.keranjang[index]['img'],
                  index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String name, String price, String image, int index) {
    return Dismissible(
      key: Key(VarGlobal.keranjang[index]['title']),
      onDismissed: (direction) {
        setState(() {
          VarGlobal.keranjang.removeAt(index);
          updateTotal();
        });
      },
      background: Container(color: Colors.red),
      child: ListTile(
        title: Text(name),
        subtitle: Text(price),
        leading: Image.asset(image),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              VarGlobal.keranjang.removeAt(index);
              updateTotal();
            });
          },
          icon: Icon(Icons.remove),
        ),
      ),
    );
  }
}
