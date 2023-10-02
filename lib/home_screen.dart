import 'package:flutter/material.dart';
import 'package:world_time_app/select_location.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  final String time, flag, period, name;

  const HomeScreen(
      {super.key,
      required this.time,
      required this.flag,
      required this.period,
      required this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          widget.period == 'AM'
              ? const Image(
                  fit: BoxFit.cover,
                  width: 400,
                  image: AssetImage(
                      'assets/images/Iphone wallpapers - landscape forest night.png'))
              : const Image(
                  image: AssetImage('assets/images/Morning Coffee.png'),
                  fit: BoxFit.cover,
                  height: 800,
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectLocation()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Select The Location"),
                        Icon(Icons.location_on)
                      ],
                    )),
              ),
              Image(
                image: AssetImage(widget.flag),
                height: 90,
                width: 90,
              ),
              Text(
                widget.time,
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w100,
                    color: Colors.white),
              ),
              Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
