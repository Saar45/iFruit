import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/fruits_data.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _showIntroNextLaunch = false;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _showIntroNextLaunch = !(prefs.getBool('seenOnboarding') ?? false);
    });
  }

  Future<void> _setShowIntro(bool value) async {
    setState(() => _showIntroNextLaunch = value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', !value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6BEF67), Color(0xFF009443)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/apple.png', height: 90),
                const SizedBox(height: 12),
                const Text(
                  'iFruit',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Learn everything about ${fruits.length} delicious fruits.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Customization'),
          SwitchListTile(
            title: const Text('Show welcome slider on next launch'),
            subtitle: const Text(
              'Replay the introduction the next time you open the app.',
            ),
            value: _showIntroNextLaunch,
            onChanged: _setShowIntro,
          ),
          const SizedBox(height: 16),
          const _SectionTitle('Application'),
          const _InfoRow(label: 'Application', value: 'iFruit'),
          const _InfoRow(label: 'Compatibility', value: 'iOS & Android'),
          const _InfoRow(label: 'Developer', value: 'Mouhamed Sarr'),
          const _InfoRow(label: 'Version', value: '1.0.0'),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(label),
      trailing: Text(
        value,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
