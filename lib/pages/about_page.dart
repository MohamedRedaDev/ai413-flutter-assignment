import 'package:material_ui/material_ui.dart';

import 'contact_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('About Page', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            const Text('Sample text about this app.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
              child: const Text('Go to Contact'),
            ),
          ],
        ),
      ),
    );
  }
}