import 'package:flutter/material.dart';
import 'package:apk1/utils/var_global.dart';

class SembakoCatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Katalog Sembako'),
      ),
      body: ListView.builder(
        itemCount: 5, // Ubah jumlah barang sesuai kebutuhan
        itemBuilder: (context, index) {
          return _buildItem(
            'Nama Sembako ${index + 1}',
            'Rp. 10.000',
            'assets/images/sample_product.png', // Ganti dengan gambar barang
            index,
          );
        },
      ),
    );
  }

  Widget _buildItem(String name, String price, String image, int index) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  price,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              addToCart(index); // Tambahkan barang ke keranjang
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void addToCart(int index) {
    VarGlobal.keranjang.add({
      'img': 'assets/images/sample_product.png',
      'title': 'Nama Barang ${index + 1}',
      'harga': 'Rp. 10.000',
    });
  }
}