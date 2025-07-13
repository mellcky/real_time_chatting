import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import '../../../presentation/theme/app_theme.dart';
import '../../../presentation/widgets/chat/message_bubble.dart';
import '../../../presentation/widgets/chat/message_input.dart';

/// Chat screen for conversations between users
class ChatScreen extends ConsumerStatefulWidget {
  final String userName;

  const ChatScreen({
    super.key,
    required this.userName,
  });

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isTyping = false;
  
  @override
  void initState() {
    super.initState();
    _loadMessages();
    
    // Simulate typing indicator
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isTyping = true;
        });
        
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              _isTyping = false;
              _receiveMessage('Hi there! How can I help you today?');
            });
          }
        });
      }
    });
  }
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  /// Load initial messages
  void _loadMessages() {
    // Simulate loading messages from a database
    final List<Map<String, dynamic>> initialMessages = [
      {
        'text': 'Hello!',
        'isMe': true,
        'time': DateTime.now().subtract(const Duration(minutes: 5)),
        'status': 'read',
        'type': 'text',
      },
      {
        'text': 'Hi! How are you?',
        'isMe': false,
        'time': DateTime.now().subtract(const Duration(minutes: 4)),
        'type': 'text',
      },
      {
        'text': 'I\'m doing great, thanks for asking!',
        'isMe': true,
        'time': DateTime.now().subtract(const Duration(minutes: 3)),
        'status': 'read',
        'type': 'text',
      },
      {
        'text': 'What about you?',
        'isMe': true,
        'time': DateTime.now().subtract(const Duration(minutes: 3)),
        'status': 'read',
        'type': 'text',
      },
    ];
    
    setState(() {
      _messages.addAll(initialMessages);
    });
  }
  
  /// Send a new message
  void _sendMessage(String text, String type) {
    if (text.trim().isEmpty) return;
    
    final newMessage = {
      'text': text,
      'isMe': true,
      'time': DateTime.now(),
      'status': 'sent',
      'type': type,
    };
    
    setState(() {
      _messages.add(newMessage);
    });
    
    _scrollToBottom();
    
    // Simulate message status updates
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _messages.last['status'] = 'delivered';
        });
        
        // Simulate typing indicator
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              _isTyping = true;
            });
            
            // Simulate reply after typing
            Future.delayed(const Duration(seconds: 3), () {
              if (mounted) {
                setState(() {
                  _isTyping = false;
                  _messages.last['status'] = 'read';
                });
                
                // Generate a random reply
                _generateReply(text);
              }
            });
          }
        });
      }
    });
  }
  
  /// Generate a reply based on the sent message
  void _generateReply(String sentText) {
    final random = Random();
    final replies = [
      'That\'s interesting!',
      'I see what you mean.',
      'Thanks for sharing that.',
      'I agree with you.',
      'Let me think about that.',
      'Could you tell me more?',
      'That\'s a good point.',
      'I hadn\'t thought of it that way.',
      'What do you think we should do next?',
      'I\'ll get back to you on that.',
    ];
    
    final reply = replies[random.nextInt(replies.length)];
    _receiveMessage(reply);
  }
  
  /// Receive a new message
  void _receiveMessage(String text) {
    final newMessage = {
      'text': text,
      'isMe': false,
      'time': DateTime.now(),
      'type': 'text',
    };
    
    setState(() {
      _messages.add(newMessage);
    });
    
    _scrollToBottom();
  }
  
  /// Scroll to the bottom of the chat
  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                widget.userName[0],
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userName,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  _isTyping ? 'typing...' : 'online',
                  style: TextStyle(
                    fontSize: 12,
                    color: _isTyping
                        ? Theme.of(context).colorScheme.primary
                        : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // TODO: Implement voice call
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Voice call feature coming soon!'),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // TODO: Implement video call
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Video call feature coming soon!'),
                ),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // TODO: Implement menu actions
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'view_profile',
                  child: Text('View Profile'),
                ),
                const PopupMenuItem<String>(
                  value: 'search',
                  child: Text('Search'),
                ),
                const PopupMenuItem<String>(
                  value: 'media',
                  child: Text('Shared Media'),
                ),
                const PopupMenuItem<String>(
                  value: 'clear',
                  child: Text('Clear Chat'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message['isMe'] as bool;
                final text = message['text'] as String;
                final time = message['time'] as DateTime;
                final status = message['status'] as String?;
                final type = message['type'] as String;
                
                return MessageBubble(
                  text: text,
                  isMe: isMe,
                  time: time,
                  status: status,
                  type: type,
                );
              },
            ),
          ),
          
          // Typing indicator
          if (_isTyping)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const SizedBox(
                    width: 40,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.userName} is typing...',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          
          // Message input
          MessageInput(
            onSendMessage: _sendMessage,
          ),
        ],
      ),
    );
  }
}