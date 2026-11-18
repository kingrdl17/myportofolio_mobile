import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/menu.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO: Impor halaman ProjectFormPage jika sudah dibuat

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            // TODO: Bagian drawer header
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
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
                  'Expwore pewsonal pwojects and expewiences!! :3',
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
            // Navigasi ke halaman tambah proyek
            onTap: () {
              /*
              TODO: Buatlah routing ke halaman ProjectFormPage yang akan dibuat nanti.
              */
            },
          ),
        ],
      ),
    );
  }
}
