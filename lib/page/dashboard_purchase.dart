import 'package:flutter/material.dart';
import 'package:apk1/utils/var_global.dart';

class DashboardPurchase extends StatefulWidget {
  @override
  _DashboardPurchaseState createState() => _DashboardPurchaseState();
}

class _DashboardPurchaseState extends State<DashboardPurchase> {
  Map<int, bool> pickUpStatus = {};
  String selectedDate = 'Hari ini'; // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VarGlobal.riwayatBelanja.isEmpty
          ? Center(
              child: Text('Ayo belanja! Riwayat belanja akan tampil disini'),
            )
          : ListView.builder(
              itemCount: VarGlobal.riwayatBelanja.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Tanggal: ${VarGlobal.riwayatBelanja[index]['tanggal']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var item in VarGlobal.riwayatBelanja[index]['barang'])
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Barang: ${item['title']}'),
                              Text('Harga: ${item['harga']}'),
                            ],
                          ),
                        Text('Total Produk: ${VarGlobal.riwayatBelanja[index]['totalProduk']}'),
                        Text('Total Belanja: Rp. ${VarGlobal.riwayatBelanja[index]['totalBelanja']}'),
                        SizedBox(height: 10),
                        if (pickUpStatus.containsKey(index) && pickUpStatus[index] == true)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Waktu Pengambilan: $selectedDate'),
                            ],
                          ),
                        if (!pickUpStatus.containsKey(index) || pickUpStatus[index] == false)
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Pilih Waktu Pengambilan'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Pilih kapan barang akan diambil:'),
                                        ListTile(
                                          title: Text('Hari ini'),
                                          onTap: () {
                                            setState(() {
                                              selectedDate = 'Hari ini';
                                              pickUpStatus[index] = true; // Menandai bahwa waktu pengambilan sudah dipilih
                                              // Tampilkan keterangan waktu pengambilan
                                              VarGlobal.riwayatBelanja[index]['waktuPengambilan'] = selectedDate;
                                            });
                                            Navigator.pop(context);
                                          },
                                          selected: selectedDate == 'Hari ini',
                                        ),
                                        ListTile(
                                          title: Text('Besok'),
                                          onTap: () {
                                            setState(() {
                                              selectedDate = 'Besok';
                                              pickUpStatus[index] = true; // Menandai bahwa waktu pengambilan sudah dipilih
                                              // Tampilkan keterangan waktu pengambilan
                                              VarGlobal.riwayatBelanja[index]['waktuPengambilan'] = selectedDate;
                                            });
                                            Navigator.pop(context);
                                          },
                                          selected: selectedDate == 'Besok',
                                        ),
                                        ListTile(
                                          title: Text('Lusa'),
                                          onTap: () {
                                            setState(() {
                                              selectedDate = 'Lusa';
                                              pickUpStatus[index] = true; // Menandai bahwa waktu pengambilan sudah dipilih
                                              // Tampilkan keterangan waktu pengambilan
                                              VarGlobal.riwayatBelanja[index]['waktuPengambilan'] = selectedDate;
                                            });
                                            Navigator.pop(context);
                                          },
                                          selected: selectedDate == 'Lusa',
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text('Pilih Waktu'),
                          ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Hapus Barang'),
                              content: Text('Anda yakin ingin menghapus barang dari riwayat belanja?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // Remove item from the list
                                    VarGlobal.riwayatBelanja.removeAt(index);
                                    // Remove pickup status if exists
                                    if (pickUpStatus.containsKey(index)) {
                                      pickUpStatus.remove(index);
                                    }
                                    // Check if the list is empty
                                    if (VarGlobal.riwayatBelanja.isEmpty) {
                                      Navigator.pop(context);
                                    }
                                    // Force rebuild
                                    setState(() {});
                                  },
                                  child: Text('Ya'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Tidak'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    onTap: () {
                      // Tampilkan informasi lengkap barang
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Detail Barang'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (var item in VarGlobal.riwayatBelanja[index]['barang'])
                                  ListTile(
                                    leading: Image.asset('assets/images/sample_product.png'), // Ganti dengan gambar barang
                                    title: Text(item['title']),
                                    subtitle: Text('Harga: ${item['harga']}\nJumlah: ${item['jumlah']}'),
                                  ),
                                Text('Total Belanja: Rp. ${VarGlobal.riwayatBelanja[index]['totalBelanja']}'),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
