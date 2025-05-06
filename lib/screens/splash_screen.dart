import 'package:flutter/material.dart';
import 'package:kmcc_hajj_25/constants/app_constants.dart';
import 'package:kmcc_hajj_25/widgets/bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for fade effect
    _animationController = AnimationController(
      duration: Duration(seconds: 3), // Duration for the fade effect
      vsync: this,
    );

    // Create the fade animation for opacity
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start the animation
    _animationController.forward();

    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BottomNavBarScreen()));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Center logo with fade effect
          Opacity(
            opacity: 0.1,
            child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    gradient: AppConstants.splashGradient,
                  ),
                ),
          ),
          Center(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/kmcc_logo.png')),
              ),
            ),
          ),
          // Heart pattern in bottom-right corner with fade effect
          Positioned(
            bottom: 0,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/bottom_vector.png'),
              ),
            ),
          ),
          // Heart pattern in top-left corner with fade effect
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/top_vector.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
