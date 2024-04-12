// ignore_for_file: prefer_const_constructors

import 'package:apk1/catalog/catalog_bodycare.dart';
import 'package:apk1/catalog/catalog_makanan.dart';
import 'package:apk1/catalog/catalog_minuman.dart';
import 'package:apk1/catalog/catalog_sembako.dart';
import 'package:apk1/utils/constants.dart';
import 'package:flutter/material.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -140.0,
          top: -50.0,
          child: Opacity(
            opacity: 0.2,
            child: Image.asset("assets/images/toko.png"),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                height: 2.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0, // Atur jarak atas dan bawah teks
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Selamat Datang, \n(User)",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0, // Atur jarak atas dan bawah gambar
                      ),
                      child: Image.asset(
                        "assets/images/userx.png",
                        height: 170,
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom -
                    2.0 -
                    40.0 -
                    240.0 -
                    24.0, // Sesuaikan tinggi dengan tinggi layar dan elemen lainnya
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        color: Constants.scaffoldBackgroundColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 24.0,
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            child: Text(
                              "Katalog Barang",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 26, 34, 183),
                              ),
                            ),
                          ),
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SembakoCatalogPage(),
                                    ),
                                  );
                                },
                                child: _buildCatalogItem(
                                  "Sembako dan Bahan Masakan",
                                  "assets/images/sample_product.png",
                                  context,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BodycareCatalogPage(),
                                    ),
                                  );
                                },
                                child: _buildCatalogItem(
                                  "Bodycare & Alat Mandi",
                                  "assets/images/bodycare.png",
                                  context,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FoodCatalogPage(),
                                    ),
                                  );
                                },
                                child: _buildCatalogItem(
                                  "Makanan",
                                  "assets/images/food.png",
                                  context,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DrinksCatalogPage(),
                                    ),
                                  );
                                },
                                child: _buildCatalogItem(
                                  "Minuman",
                                  "assets/images/drinks.png",
                                  context,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

    Widget _buildCatalogItem(String title, String image, BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.lightBlue[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
    );
  }


}
