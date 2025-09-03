import 'package:flutter/material.dart';

class CourseCategories extends StatelessWidget {
  final String activeCategory;
  final Function(String) onCategoryChange;
  final bool isMobile;

  const CourseCategories({
    super.key,
    required this.activeCategory,
    required this.onCategoryChange,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'id': 'all', 'name': 'All Courses', 'icon': Icons.public, 'count': 500},
      {'id': 'arbitration', 'name': 'International Arbitration', 'icon': Icons.gavel, 'count': 145},
      {'id': 'mediation', 'name': 'Mediation', 'icon': Icons.people, 'count': 89},
      {'id': 'commercial-law', 'name': 'Commercial Law', 'icon': Icons.description, 'count': 124},
      {'id': 'corporate-disputes', 'name': 'Corporate Disputes', 'icon': Icons.business, 'count': 67},
      {'id': 'compliance', 'name': 'Compliance & Ethics', 'icon': Icons.balance, 'count': 75},
    ];

    return SingleChildScrollView(
      scrollDirection: isMobile ? Axis.horizontal : Axis.vertical,
      padding: EdgeInsets.zero,
      child: isMobile
          ? Row(
              children: categories
                  .map((cat) {
                    bool isActive = activeCategory == cat['id'];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          cat['icon'] as IconData,
                          size: 18,
                          color: isActive ? Colors.white : Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          '${cat['name']} (${cat['count']})',
                          style: const TextStyle(fontSize: 14),
                        ),
                        onPressed: () => onCategoryChange(cat['id'] as String),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isActive
                              ? Theme.of(context).colorScheme.primary
                              : Colors.white,
                          foregroundColor: isActive
                              ? Colors.white
                              : Theme.of(context).colorScheme.primary,
                          side: BorderSide(color: Theme.of(context).colorScheme.primary),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    );
                  })
                  .toList(),
            )
          : Wrap(
              spacing: 12,
              runSpacing: 12,
              children: categories
                  .map((cat) {
                    bool isActive = activeCategory == cat['id'];
                    return ElevatedButton.icon(
                      icon: Icon(
                        cat['icon'] as IconData,
                        size: 18,
                        color: isActive ? Colors.white : Theme.of(context).colorScheme.primary,
                      ),
                      label: Text(
                        '${cat['name']} (${cat['count']})',
                        style: const TextStyle(fontSize: 14),
                      ),
                      onPressed: () => onCategoryChange(cat['id'] as String),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isActive
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        foregroundColor: isActive
                            ? Colors.white
                            : Theme.of(context).colorScheme.primary,
                        side: BorderSide(color: Theme.of(context).colorScheme.primary),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    );
                  })
                  .toList(),
            ),
    );
  }
}