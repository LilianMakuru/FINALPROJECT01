import 'package:flutter/material.dart';
import 'package:garagepopote/BuyAndSellPartPage.dart';
import 'package:garagepopote/GarageLocatorPage.dart';
import 'package:garagepopote/NearbyFundiPage.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GARAGE POPOTE Home'),
      ),
      body: Container(
        color: Colors.lightBlueAccent, // Suggested background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'GARAGE POPOTE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text('Choose an option:'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Buy and Sell Part page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BuyAndSellPartPage())); // Ensure you have a corresponding BuyAndSellPartPage
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), // Blue button
                child: Text('Buy and Sell Part'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Nearby Fundi page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage())); // Ensure you have a corresponding NearbyFundiPage
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), // Blue button
                child: Text('Nearby Fundi'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Garage Locator page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Garagelocator())); // Ensure you have a corresponding GarageLocatorPage
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                ), // Blue button
                child: Text('Garage Locator'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
