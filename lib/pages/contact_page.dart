import 'package:material_ui/material_ui.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mail_outline, size: 64),
            SizedBox(height: 16),
            Text('Contact Page', style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text('Sample text: name@example.com'),
          ],
        ),
      ),
    );
  }
}