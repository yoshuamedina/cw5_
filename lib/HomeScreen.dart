import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this line for SystemUiOverlayStyle
import 'GameLogic.dart'; // Importing the GameLogic.dart file

void main() => runApp(MaterialApp(home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // @Override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedRocket = 'ship.png'; // Initial selected rocket/player option

  // @Override
  Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      title: const Text(
        'Rocket Space Shooter Game',
        style: TextStyle(
          color: Colors.blue, // Text color set to white
          fontWeight: FontWeight.bold, // Text style set to bold
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light, // For light status bar icons
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8, 
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'), // Ensure you have this asset in your images folder
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
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
                  const SizedBox(height: 50), // Space between the rocket options and the start button
                  StartButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameWidget(
                            game: SpaceShooterGame(selectedRocket),
                          ),
                        ),
                      );
                    },
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

class RocketOption extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onPressed;

  const RocketOption({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.onPressed,
  });

  // @Override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.03), // Adjust padding based on screen width
        decoration: BoxDecoration(
          border: isSelected ? Border.all(color: Colors.blue, width: 3) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          imagePath,
          width: screenWidth * 0.2, // Adjust image size based on screen width
        ),
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartButton({
    super.key,
    required this.onPressed,
  });

  // @Override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      child: const Text(
        'Start Game',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
