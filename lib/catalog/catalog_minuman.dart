import 'package:flutter/material.dart';
import 'package:apk1/utils/var_global.dart';

class DrinksCatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Katalog Minuman'),
      ),
      body: ListView.builder(
        itemCount: 3, // Ubah jumlah minuman sesuai kebutuhan
        itemBuilder: (context, index) {
          return _buildItem(
            'Nama Minuman ${index + 1}',
            'Rp. 8.000',
            'assets/images/drinks.png', // Ganti dengan gambar minuman
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
              addToCart(index); // Tambahkan minuman ke keranjang
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
      'title': 'Nama Minuman ${index + 1}',
      'harga': 'Rp. 8.000',
    });
  }
}
