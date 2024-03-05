import 'package:flutter/material.dart';
import 'package:newsapp/views/widgets/theme_switch.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.change_circle),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  ' App Theme :',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  width: 20,
                ),
                const ThemeSwitch() // <- changes the theme
              ],
            ),
          ),
          ListTile(
            onTap: () {
              //open privacy policy
            },
            leading: const Icon(Icons.policy),
            title: const Text('Privacy Policy'),
          ),
          ListTile(
            leading: const Icon(Icons.share),
            onTap: () {
              // app sharing logic
            },
            title: const Text('Feedback'),
          ),
        ],
      ),
    );
  }
}
