import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

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
  final List<ItemHomepage> experienceItems = const [
    ItemHomepage(
      'View Experience',
      Icons.work_outline,
      color: Colors.deepPurple,
      subtitle: "Take a look at what I've done",
    ),
    ItemHomepage(
      'Add Experience',
      Icons.add_circle_outline,
      color: Colors.teal,
      subtitle: 'Add new experience',
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
            PortfolioSection(title: 'Experience', items: experienceItems),
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

//sections containing cards
class PortfolioSection extends StatelessWidget {
  final String title;
  final List<ItemHomepage> items;

  const PortfolioSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20), //outer card roundness
          child: Column(
            children: [
              for (var index = 0; index < items.length; index++) ...[
                PortfolioActionCard(item: items[index]),
                if (index < items.length - 1)
                  const SizedBox(height: 2), //space between cards
              ],
            ],
          ),
        ),
      ],
    );
  }
}

//the cards
class PortfolioActionCard extends StatelessWidget {
  final ItemHomepage item;

  const PortfolioActionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final accentColor = item.color ?? colorScheme.primary;
    final cardBackground = Color.alphaBlend(
      colorScheme.brightness == Brightness.dark
          ? Colors.white.withValues(alpha: 0.05)
          : Colors.black.withValues(alpha: 0.08),
      colorScheme.surface,
    );

    return Material(
      color: cardBackground,
      borderRadius: BorderRadius.circular(4), //inner card roundness
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTapDown: (_) => HapticFeedback.selectionClick(),
        onTapUp: (_) => HapticFeedback.lightImpact(),
        onTap: () => _showItemFeedback(context, item),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.24),
                  shape: BoxShape.circle,
                ),
                child: Icon(item.icon, color: accentColor, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall
                          ?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//snack bar
void _showItemFeedback(BuildContext context, ItemHomepage item) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text('You have pressed ${item.name}!')));
}
