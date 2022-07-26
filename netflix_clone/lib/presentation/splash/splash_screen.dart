import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/main_page/screen_main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goNetflixHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage(
            "https://assets.uigarage.net/content/uploads/2019/02/Screen-Shot-2019-02-25-at-12.38.36-pm.png",
          ),
        ),
      ),
    );
  }

  Future<void> goNetflixHome() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return ScreenMainPage();
        },
      ),
    );
  }
}
