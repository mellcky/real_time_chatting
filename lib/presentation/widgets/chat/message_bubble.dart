import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../presentation/theme/app_theme.dart';

/// A widget that displays a chat message bubble
class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final DateTime time;
  final String? status;
  final String type;

  const MessageBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
    this.status,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Avatar for received messages
          if (!isMe)
            CircleAvatar(
              radius: 16,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(
                Icons.person,
                size: 16,
                color: Colors.white,
              ),
            ),
          
          const SizedBox(width: 8),
          
          // Message content
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isMe
                    ? AppTheme.getSentMessageColor(context)
                    : AppTheme.getReceivedMessageColor(context),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: isMe ? const Radius.circular(16) : const Radius.circular(4),
                  bottomRight: isMe ? const Radius.circular(4) : const Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Message content based on type
                  _buildMessageContent(context),
                  
                  const SizedBox(height: 4),
                  
                  // Time and status
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('h:mm a').format(time),
                        style: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7),
                        ),
                      ),
                      if (isMe && status != null) ...[
                        const SizedBox(width: 4),
                        _buildStatusIcon(context),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(width: 8),
          
          // Avatar placeholder for sent messages (for alignment)
          if (isMe)
            const SizedBox(width: 32),
        ],
      ),
    );
  }

  /// Build the message content based on the message type
  Widget _buildMessageContent(BuildContext context) {
    switch (type) {
      case 'text':
        return Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isMe
                ? Theme.of(context).brightness == Brightness.light
                    ? Colors.black87
                    : Colors.white
                : Theme.of(context).textTheme.bodyLarge?.color,
          ),
        );
      case 'image':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                text, // URL of the image
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 200,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: const Icon(Icons.error),
                  );
                },
              ),
            ),
          ],
        );
      case 'audio':
        return Row(
          children: [
            Icon(
              Icons.play_circle_fill,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LinearProgressIndicator(
                    value: 0.0,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Voice message',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case 'video':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        'Video',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.play_circle_fill,
                  size: 48,
                  color: Colors.white.withOpacity(0.8),
                ),
              ],
            ),
          ],
        );
      case 'file':
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade200
                : Colors.grey.shade800,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.insert_drive_file),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Document.pdf',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '2.5 MB',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.download),
            ],
          ),
        );
      default:
        return Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isMe
                ? Theme.of(context).brightness == Brightness.light
                    ? Colors.black87
                    : Colors.white
                : Theme.of(context).textTheme.bodyLarge?.color,
          ),
        );
    }
  }

  /// Build the status icon based on the message status
  Widget _buildStatusIcon(BuildContext context) {
    switch (status) {
      case 'sent':
        return const Icon(
          Icons.check,
          size: 12,
          color: Colors.grey,
        );
      case 'delivered':
        return const Icon(
          Icons.done_all,
          size: 12,
          color: Colors.grey,
        );
      case 'read':
        return Icon(
          Icons.done_all,
          size: 12,
          color: Theme.of(context).colorScheme.primary,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}