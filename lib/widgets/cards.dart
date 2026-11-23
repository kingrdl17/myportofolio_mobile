import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/post_form.dart';
import 'package:myportofolio_mobile/screens/menu.dart';

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
        onTap: () {
          if (item.name == 'Add Project') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProjectFormPage()),
            );
          } else if (item.name == 'New Post') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PostFormPage()),
            );
          } else {
            _showItemFeedback(context, item);
          }
        },
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
