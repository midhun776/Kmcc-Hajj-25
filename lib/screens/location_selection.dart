import 'package:flutter/material.dart';
import 'package:kmcc_hajj_25/constants/app_constants.dart';
import 'package:kmcc_hajj_25/widgets/location_chip_widget.dart';

class LocationSelection extends StatefulWidget {
  const LocationSelection({super.key});

  @override
  State<LocationSelection> createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  List<String> locations = [
    "Mina",
    "Makkah",
    "Madina",
    "Azizia",
    "Arafat",
    "Muzdalifah",
  ];

  var selectedLocation;

  void toggleSelection(String location) {
    setState(() {
      if (selectedLocation == location) {
        selectedLocation = null;
      } else if (locations.contains(location)) {
        selectedLocation = location;
      }
    });
    print("Selected Location: $selectedLocation");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/location_vector.png'),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Text("Select your location", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(
                    "Discover nearby services and navigate your Hajj journey with ease. Choose a location to get started.",
                    style: TextStyle(fontSize: 12), 
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: locations.map((location) {
                        return LocationChipWidget(
                          location: location,
                          isSelected: selectedLocation == location,
                          onTap: () => toggleSelection(location),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}