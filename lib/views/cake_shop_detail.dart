import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/models/cake_shop.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class CakeShopDetail extends StatelessWidget {
  final CakeShop cakeShop;

  CakeShopDetail({super.key, required this.cakeShop});

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final shop = cakeShop;
    final shopLatitude = double.parse(shop.latitude ?? '0');
    final shopLongitude = double.parse(shop.longitude ?? '0');

    return Scaffold(
      backgroundColor: Color(0xFFFFF7FF),
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(shop.name ?? 'รายละเอียดร้านเค้ก'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                shop.image1 ?? 'assets/images/s11.jpg',
                width: 180,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    shop.image2 ?? shop.image1 ?? 'assets/images/s11.jpg',
                    width: 115,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    shop.image3 ?? shop.image1 ?? 'assets/images/s11.jpg',
                    width: 115,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text('ชื่อร้าน 🍰'),
          Text(shop.name ?? ''),
          SizedBox(height: 20),
          Text('เวลาเปิดปิด ⏰'),
          Text(shop.openCloseTime ?? ''),
          SizedBox(height: 20),
          Text('รายละเอียดของร้าน 🧁'),
          Text(shop.description ?? ''),
          SizedBox(height: 20),
          Text('ที่อยู่ของร้าน 📍'),
          Text(shop.address ?? ''),
          SizedBox(height: 12),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 8),
                  Text(shop.phone ?? 'โทรหาร้าน'),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          ListTile(
            onTap: () {
              _launchInBrowser(Uri.parse(shop.website ?? ''));
            },
            leading: Icon(Icons.language, color: Colors.amber, size: 30),
            trailing: Icon(Icons.link),
            title: Text(shop.website ?? ''),
          ),
          SizedBox(height: 30),
          ListTile(
            onTap: () {
              _launchInBrowser(Uri.parse(shop.facebook ?? ''));
            },
            leading: Icon(Icons.facebook, color: Colors.blue, size: 30),
            trailing: Icon(Icons.link),
            title: Text(shop.facebook ?? ''),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 300,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(shopLatitude, shopLongitude),
                initialZoom: 15,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.flutter_cake_shop_project',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(shopLatitude, shopLongitude),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution('OpenStreetMap contributors'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
