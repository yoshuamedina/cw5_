import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'GameLogic.dart'; // Importing the playgame.dart file

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedRocket = 'ship.png'; // Initial selected rocket/player option

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Space Shooter Game'),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    ''), // Replace 'background_image.jpg' with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RocketOption(
                      imagePath: 'assets/images/ship.png',
                      isSelected: selectedRocket == 'ship.png',
                      onPressed: () {
                        setState(() {
                          selectedRocket = 'ship.png';
                        });
                      },
                    ),
                    RocketOption(
                      imagePath: 'assets/images/start-up.png',
                      isSelected: selectedRocket == 'start-up.png',
                      onPressed: () {
                        setState(() {
                          selectedRocket = 'start-up.png';
                        });
                      },
                    ),
                    RocketOption(
                      imagePath: 'assets/images/project.png',
                      isSelected: selectedRocket == 'project.png',
                      onPressed: () {
                        setState(() {
                          selectedRocket = 'project.png';
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                    height: screenHeight *
                        0.1), // Adding space between buttons and the "Start Game" button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GameWidget(
                              game: SpaceShooterGame(selectedRocket))),
                    );
                  },
                  child: Text('Start Game'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RocketOption extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onPressed;

  RocketOption({
    required this.imagePath,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(
            screenWidth * 0.03), // Adjust padding based on screen width
        decoration: BoxDecoration(
          border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(imagePath,
            width:
                screenWidth * 0.2), // Adjust image size based on screen width
      ),
    );
  }
}
