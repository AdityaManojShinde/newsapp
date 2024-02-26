import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/controller/provider.dart';

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return Row(
      children: [
        Icon(themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
        Switch(
            value: themeMode == ThemeMode.dark,
            onChanged: (value) {
              ref
                  .read(themeProvider.notifier)
                  .update((state) => value ? ThemeMode.dark : ThemeMode.light);
            })
      ],
    );
  }
}
