import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/widgets/cards.dart';

//list of contents
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String npm = '2506621024';
  final String nama = 'Clay';
  final String kelas = 'PBP F';
  final List<ItemHomepage> projectItems = const [
    ItemHomepage(
      'View Projects',
      Icons.folder,
      color: Colors.blue,
      subtitle: 'Explore my works',
    ),
    ItemHomepage(
      'Add Project',
      Icons.add_circle,
      color: Colors.green,
      subtitle: 'Add a new project',
    ),
  ];
  final List<ItemHomepage> postItems = const [
    ItemHomepage(
      'View Posts',
      Icons.article_rounded,
      color: Colors.deepPurple,
      subtitle: "Take a look at what I've done",
    ),
    ItemHomepage(
      'New Post',
      Icons.create,
      color: Colors.teal,
      subtitle: 'Make a new post',
    ),
  ];
  final ItemHomepage logoutItem = const ItemHomepage(
    'Log out',
    Icons.logout,
    color: Colors.red,
    subtitle: 'get out nga',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clay\'s Portfolio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            PortfolioSection(title: 'Projects', items: projectItems),
            const SizedBox(height: 16),
            PortfolioSection(title: 'Posts', items: postItems),
            const SizedBox(height: 24),
            PortfolioSection(title: 'Other', items: [logoutItem]),
          ],
        ),
      ),
    );
  }
}

//top card that says npm, name, class
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(content, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color? color;
  final String subtitle;

  const ItemHomepage(this.name, this.icon, {this.color, this.subtitle = ''});
}
