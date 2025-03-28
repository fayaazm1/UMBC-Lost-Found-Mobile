import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umbc_lost_found_mobile/providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const LostItemsTab(),
    const FoundItemsTab(),
    const MyItemsTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UMBC Lost & Found'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to notifications screen
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Lost',
          ),
          NavigationDestination(
            icon: Icon(Icons.find_in_page),
            label: 'Found',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt),
            label: 'My Items',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create item screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LostItemsTab extends StatelessWidget {
  const LostItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Lost Items'),
    );
  }
}

class FoundItemsTab extends StatelessWidget {
  const FoundItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Found Items'),
    );
  }
}

class MyItemsTab extends StatelessWidget {
  const MyItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('My Items'),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),
          const SizedBox(height: 16),
          Text(
            user?.username ?? 'User',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            user?.email ?? 'email@example.com',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile'),
            onTap: () {
              // TODO: Navigate to edit profile screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // TODO: Navigate to notifications screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              await authProvider.signOut();
              if (!context.mounted) return;
              // TODO: Navigate to welcome screen
            },
          ),
        ],
      ),
    );
  }
}
