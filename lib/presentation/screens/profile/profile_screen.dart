import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/login_screen.dart';

/// Profile screen showing user information and settings
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  // Mock user data
  final Map<String, dynamic> _userData = {
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'phone': '+1 (555) 123-4567',
    'bio': 'Software developer and Flutter enthusiast',
    'avatar': null, // Will be replaced with actual image
  };

  bool _darkMode = false;
  bool _notifications = true;
  bool _readReceipts = true;
  
  @override
  void initState() {
    super.initState();
    // Get the current theme mode
    _darkMode = Theme.of(context).brightness == Brightness.dark;
  }

  /// Handle logout
  Future<void> _handleLogout() async {
    // Show confirmation dialog
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
    
    if (shouldLogout == true) {
      // TODO: Implement Firebase logout
      // For now, just navigate to login screen
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Navigate to edit profile screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Edit profile feature coming soon!'),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            _buildProfileHeader(),
            
            const SizedBox(height: 16),
            
            // Settings sections
            _buildSettingsSection(),
            
            const SizedBox(height: 16),
            
            // Account section
            _buildAccountSection(),
            
            const SizedBox(height: 24),
            
            // Logout button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: _handleLogout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  foregroundColor: Theme.of(context).colorScheme.onError,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Logout'),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // App version
            Text(
              'Version 1.0.0',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  /// Build the profile header with avatar and user info
  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar
          CircleAvatar(
            radius: 50,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: _userData['avatar'] != null
                ? null
                : Text(
                    _userData['name'][0],
                    style: TextStyle(
                      fontSize: 40,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
          ),
          const SizedBox(height: 16),
          
          // Name
          Text(
            _userData['name'],
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          
          // Email
          Text(
            _userData['email'],
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 4),
          
          // Phone
          Text(
            _userData['phone'],
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          
          // Bio
          Text(
            _userData['bio'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
        ],
      ),
    );
  }

  /// Build the settings section
  Widget _buildSettingsSection() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Divider(height: 1),
          
          // Dark mode
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Enable dark theme'),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
              // TODO: Implement theme switching
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Theme switching will be implemented soon!'),
                ),
              );
            },
          ),
          
          // Notifications
          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Enable push notifications'),
            value: _notifications,
            onChanged: (value) {
              setState(() {
                _notifications = value;
              });
              // TODO: Implement notifications toggle
            },
          ),
          
          // Read receipts
          SwitchListTile(
            title: const Text('Read Receipts'),
            subtitle: const Text('Let others know when you\'ve read their messages'),
            value: _readReceipts,
            onChanged: (value) {
              setState(() {
                _readReceipts = value;
              });
              // TODO: Implement read receipts toggle
            },
          ),
        ],
      ),
    );
  }

  /// Build the account section
  Widget _buildAccountSection() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Account',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Divider(height: 1),
          
          // Change password
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to change password screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Change password feature coming soon!'),
                ),
              );
            },
          ),
          
          // Privacy
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy and Security'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to privacy settings screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Privacy settings feature coming soon!'),
                ),
              );
            },
          ),
          
          // Data and storage
          ListTile(
            leading: const Icon(Icons.storage_outlined),
            title: const Text('Data and Storage'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to data settings screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Data settings feature coming soon!'),
                ),
              );
            },
          ),
          
          // Help
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help and Support'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to help screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Help and support feature coming soon!'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}