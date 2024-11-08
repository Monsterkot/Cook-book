import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme_provider.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    //final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).popForced(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Dark Theme'),
              value: themeProvider.isDarkTheme,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
