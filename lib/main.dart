import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'main_app_screen.dart';  // Import the separate Dart file for MainAppScreen

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/main': (context) => MainAppScreen(),
      },
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  double _currentPage = 0;

  final List<OnboardingSlide> slides = [
    OnboardingSlide(
      title: "SICKLE CELL APP",
      description: "Managing sickle cell made easier.",
      image: "assets/image1.png",
      backgroundColor: Colors.blue,
    ),
    OnboardingSlide(
      title: "LOG SYMPTOMS",
      description: "Easily log and track your symptoms.",
      image: "assets/image2.png",
      backgroundColor: Colors.red,
    ),
    OnboardingSlide(
      title: "REMINDERS",
      description: "Never forget medications with timely reminders.",
      image: "assets/image3.png",
      backgroundColor: Colors.green,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: slides.length,
              itemBuilder: (context, index) {
                return SlideContent(slide: slides[index]);
              },
            ),
          ),
          DotsIndicator(
            dotsCount: slides.length,
            decorator: DotsDecorator(
              activeColor: Colors.blue, 
            ),
          ),
          SizedBox(height: 20),
          _buildNavigationButtons(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(_currentPage > 0)
            TextButton(onPressed: _skipOnboarding, child: Text("Skip")),
          if (_currentPage < slides.length - 1)
            TextButton(onPressed: _goToNextPage, child: Text("Next"))
          else
            TextButton(onPressed: _skipOnboarding, child: Text("Get Started")),
        ],
      ),
    );
  }

  void _skipOnboarding() {
    Navigator.pushReplacementNamed(context, '/main');
  }

  void _goToNextPage() {
    _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}

class OnboardingSlide {
  final String title;
  final String description;
  final String image;
  final Color backgroundColor;

  OnboardingSlide({
    required this.title,
    required this.description,
    required this.image,
    required this.backgroundColor,
  });
}

class SlideContent extends StatelessWidget {
  final OnboardingSlide slide;

  SlideContent({required this.slide});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double textSize = width > 600 ? 24 : 18; 

    return Container(
      color: slide.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(slide.image),
          SizedBox(height: 20),
          Text(
            slide.title,
            style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            slide.description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
