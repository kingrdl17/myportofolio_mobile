import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/post_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:myportofolio_mobile/screens/login_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';

// TODO: Impor halaman ProjectFormPage jika sudah dibuat

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthState>().isLoggedIn;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        children: [
          DrawerHeader(
            // TODO: Bagian drawer header

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Marclay Ardell',
                  style: GoogleFonts.bagelFatOne(
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Personal Portofolio',
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          // TODO: Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Navigasi ke halaman utama portofolio
            onTap: () {
              HapticFeedback.selectionClick();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Add Project'),
            onTap: () async {
              final ok = await ensureLoggedIn(context);
              if (ok && context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProjectFormPage(),
                  ),
                );
              }
            },
          ),
          // Login / Logout dinamis
          if (!isLoggedIn)
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            )
          else
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await context.read<AuthState>().logout();
                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out successfully')),
                  );
                }
              },
            ),
          ListTile(
            leading: const Icon(Icons.create_outlined),
            title: const Text('New Post'),
            onTap: () {
              HapticFeedback.selectionClick();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PostFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
