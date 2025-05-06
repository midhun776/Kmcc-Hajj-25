import 'package:flutter/material.dart';
import 'package:kmcc_hajj_25/constants/app_constants.dart';
import 'package:kmcc_hajj_25/widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  final List<_HomeTile> tiles = [
    _HomeTile(title: "Makhtab", icon: Icons.campaign),
    _HomeTile(title: "Hospital", icon: Icons.local_hospital),
    _HomeTile(title: "Clinic", icon: Icons.medical_services),
    _HomeTile(title: "Ambulance", icon: Icons.emergency),
    _HomeTile(
        title: "Nusuk",
        icon: Icons.layers), // Replace with a better icon if needed
    _HomeTile(title: "Bus Stations", icon: Icons.directions_bus),
    _HomeTile(title: "Train Station", icon: Icons.train),
    _HomeTile(title: "Public Toilets", icon: Icons.wc),
    _HomeTile(title: "Hajj/Umrah Guide", icon: Icons.menu_book),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(16),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: tiles.map((tile) => HomeCard(title: tile.title, icon: tile.icon)).toList(),
                ),
              ),
            ),
            _buildBottomIllustration(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFFFDF5ED),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Image.asset('assets/appbar_logo.png',
              height: 40), // Add your logo to assets
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Row(
                children: [
                  Text('Makkah',
                      style: TextStyle(fontWeight: FontWeight.bold, height: 1)),
                  Icon(Icons.location_on, color: AppConstants.primaryBlue, size: 20,),
                ],
              ),
              Text('Tap to change location',
                  style:
                      TextStyle(fontSize: 12, color: Colors.orange, height: 1)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomIllustration() {
    return Image.asset('assets/home_vector.png');
  }
}

class _HomeTile {
  final String title;
  final IconData icon;

  _HomeTile({required this.title, required this.icon});
}
