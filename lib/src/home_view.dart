import 'package:flutter/material.dart';

/// Main screen where users land upon starting the application.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              // Title
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "Rakennusten purkumateriaalien arviointilaskuri",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // micropolis logo
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'assets/images/micropolis_transparent.png',
                    scale: 6,
                  ),
                ),
              ),

              // navigation buttons
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 40.0,
                  children: [
                    // large buildings button
                    ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.blue,
                      //     foregroundColor: Colors.green,
                      //   ),
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/large_buildings'),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          "Suuret rakennukset",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // row houses and small flats button
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/smaller_buildings'),
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text("Rivi- ja pienkerrostalot",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              // sponsor logos
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 88.0,
                    children: [
                      Image.asset(
                        'assets/images/FI_co-funded by VERTICAL RGB_POS.png',
                        scale: 6.0,
                      ),
                      Image.asset(
                        'assets/images/PPL_tunnus_pysty_RGB.png',
                        scale: 9.4,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
