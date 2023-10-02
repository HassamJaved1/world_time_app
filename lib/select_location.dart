import 'package:flutter/material.dart';
import 'package:world_time_app/home_screen.dart';
import 'package:world_time_app/time.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({super.key});

  @override
  Widget build(BuildContext context) {
    List<Time> locations = [
      Time(
          location: "Asia/Karachi",
          flag: 'assets/images/Pakistan.png',
          name: "Pakistan"),
      Time(
          location: "Europe/Paris",
          flag: 'assets/images/France.jpg',
          name: "France"),
      Time(
          location: "Europe/Rome",
          flag: 'assets/images/Italy.jpg',
          name: "Italy"),
      Time(
          location: "Europe/London",
          flag: 'assets/images/UK.png',
          name: "United Kingdom"),
      Time(
          location: "Europe/Berlin",
          flag: 'assets/images/Germany.jpg',
          name: "Germany"),
      Time(
          location: "Asia/Tokyo",
          flag: 'assets/images/Japan.png',
          name: "Japan"),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Select Location"),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image(
                image: AssetImage(locations[index].flag),
                width: 70,
                height: 70,
              ),
              title: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(locations[index].name),
              ),
              onTap: () async {
                String timer =
                    await locations[index].calculateInternationalTime();

                // ignore: use_build_context_synchronously
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(
                              time: timer,
                              flag: locations[index].flag,
                              period: locations[index].period,
                              name: locations[index].name,
                            )));
              },
            );
          }),
    );
  }
}
