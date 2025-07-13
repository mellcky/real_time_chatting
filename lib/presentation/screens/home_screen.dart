import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'chat/chat_screen.dart';
import 'profile/profile_screen.dart';
import 'auth/login_screen.dart';

/// Main screen of the app showing the list of chats
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;
  final List<String> _chatUsers = [
    'John Doe',
    'Jane Smith',
    'Robert Johnson',
    'Emily Davis',
    'Michael Wilson',
    'Sarah Brown',
    'David Miller',
    'Lisa Taylor',
    'James Anderson',
    'Jennifer Thomas',
  ];

  final List<String> _chatMessages = [
    'Hey, how are you?',
    'Can we meet tomorrow?',
    'Did you see the latest update?',
    'Thanks for your help!',
    'I\'ll send you the files soon',
    'Let\'s discuss this later',
    'Are you available for a call?',
    'Have a great day!',
    'What do you think about the project?',
    'See you at the meeting',
  ];

  final List<String> _chatTimes = [
    '2 min ago',
    '15 min ago',
    '1 hour ago',
    'Yesterday',
    'Yesterday',
    '2 days ago',
    '3 days ago',
    '5 days ago',
    '1 week ago',
    '2 weeks ago',
  ];

  /// Handle logout
  Future<void> _handleLogout() async {
    // TODO: Implement Firebase logout
    // For now, just navigate to login screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  /// Navigate to chat screen
  void _navigateToChatScreen(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          userName: _chatUsers[index],
        ),
      ),
    );
  }

  /// Create a new chat
  void _createNewChat() {
    // TODO: Implement new chat creation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('New chat feature coming soon!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                _handleLogout();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'settings',
                  child: Text('Settings'),
                ),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewChat,
        child: const Icon(Icons.chat),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  /// Build the body based on the selected tab
  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildChatsList();
      case 1:
        return _buildContactsList();
      case 2:
        return const ProfileScreen();
      default:
        return _buildChatsList();
    }
  }

  /// Build the chats list
  Widget _buildChatsList() {
    return ListView.builder(
      itemCount: _chatUsers.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              _chatUsers[index][0],
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          title: Text(_chatUsers[index]),
          subtitle: Text(
            _chatMessages[index],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _chatTimes[index],
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),
              if (index % 3 == 0)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
          onTap: () => _navigateToChatScreen(index),
        );
      },
    );
  }

  /// Build the contacts list
  Widget _buildContactsList() {
    return ListView.builder(
      itemCount: _chatUsers.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Text(
              _chatUsers[index][0],
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          title: Text(_chatUsers[index]),
          subtitle: Text('Online', 
            style: TextStyle(
              color: index % 2 == 0 ? Colors.green : Colors.grey,
            ),
          ),
          onTap: () => _navigateToChatScreen(index),
        );
      },
    );
  }
}
