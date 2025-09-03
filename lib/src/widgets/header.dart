import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isMobile;

  const Header({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Text(
              'C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CIMA Learn',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2E2E2E),
                  ),
                ),
                Text(
                  'Dispute Resolution Training',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu, size: 24),
              onPressed: () {},
              color: Theme.of(context).colorScheme.onSurface,
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.search, size: 24),
                  onPressed: () {},
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart, size: 24),
                  onPressed: () {},
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign Up'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}