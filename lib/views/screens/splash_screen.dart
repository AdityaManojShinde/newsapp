import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/world.jpg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.7,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '"Beyond the headlines, discover the stories shaping our world."',
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  child: const Text('Get Started')),
            )
          ],
        ),
      ),
    );
  }
}
