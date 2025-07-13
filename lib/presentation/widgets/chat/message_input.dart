import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A widget for composing and sending messages
class MessageInput extends ConsumerStatefulWidget {
  final Function(String, String) onSendMessage;

  const MessageInput({
    super.key,
    required this.onSendMessage,
  });

  @override
  ConsumerState<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends ConsumerState<MessageInput> {
  final TextEditingController _textController = TextEditingController();
  bool _isRecording = false;
  bool _showAttachments = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  /// Send a text message
  void _handleSendMessage() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      widget.onSendMessage(text, 'text');
      _textController.clear();
    }
  }

  /// Toggle voice recording
  void _toggleRecording() {
    // TODO: Implement actual recording functionality
    setState(() {
      _isRecording = !_isRecording;
    });

    if (!_isRecording) {
      // Simulate sending a voice message
      widget.onSendMessage('Voice message', 'audio');
    }
  }

  /// Toggle attachments menu
  void _toggleAttachments() {
    setState(() {
      _showAttachments = !_showAttachments;
    });
  }

  /// Handle sending an image
  void _handleImageAttachment() {
    // TODO: Implement image picker and upload
    widget.onSendMessage('https://via.placeholder.com/300', 'image');
    _toggleAttachments();
  }

  /// Handle sending a video
  void _handleVideoAttachment() {
    // TODO: Implement video picker and upload
    widget.onSendMessage('Video message', 'video');
    _toggleAttachments();
  }

  /// Handle sending a file
  void _handleFileAttachment() {
    // TODO: Implement file picker and upload
    widget.onSendMessage('File message', 'file');
    _toggleAttachments();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Attachments menu
        if (_showAttachments)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade100
                : Colors.grey.shade800,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAttachmentButton(
                  icon: Icons.image,
                  label: 'Image',
                  color: Colors.green,
                  onTap: _handleImageAttachment,
                ),
                _buildAttachmentButton(
                  icon: Icons.videocam,
                  label: 'Video',
                  color: Colors.red,
                  onTap: _handleVideoAttachment,
                ),
                _buildAttachmentButton(
                  icon: Icons.insert_drive_file,
                  label: 'File',
                  color: Colors.blue,
                  onTap: _handleFileAttachment,
                ),
                _buildAttachmentButton(
                  icon: Icons.location_on,
                  label: 'Location',
                  color: Colors.orange,
                  onTap: () {
                    // TODO: Implement location sharing
                    _toggleAttachments();
                  },
                ),
                _buildAttachmentButton(
                  icon: Icons.person,
                  label: 'Contact',
                  color: Colors.purple,
                  onTap: () {
                    // TODO: Implement contact sharing
                    _toggleAttachments();
                  },
                ),
              ],
            ),
          ),

        // Input bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                // Attachment button
                IconButton(
                  icon: Icon(
                    _showAttachments ? Icons.close : Icons.attach_file,
                    color: _showAttachments
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                  onPressed: _toggleAttachments,
                ),

                // Camera button
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    // TODO: Implement camera functionality
                    widget.onSendMessage('https://via.placeholder.com/300', 'image');
                  },
                ),

                // Text input field
                Expanded(
                  child: _isRecording
                      ? _buildRecordingIndicator()
                      : TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Theme.of(context).brightness == Brightness.light
                                ? Colors.grey.shade100
                                : Theme.of(context).colorScheme.surface.withOpacity(0.6),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                          minLines: 1,
                          maxLines: 5,
                          onChanged: (text) {
                            // Trigger setState to update the send button
                            setState(() {});
                          },
                        ),
                ),

                const SizedBox(width: 12),

                // Send or voice record button
                _textController.text.trim().isEmpty
                    ? GestureDetector(
                        onLongPress: _toggleRecording,
                        onLongPressEnd: (_) {
                          if (_isRecording) {
                            _toggleRecording();
                          }
                        },
                        child: Material(
                          elevation: 2,
                          shape: const CircleBorder(),
                          color: _isRecording 
                              ? Colors.red 
                              : Theme.of(context).colorScheme.primary,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(2),
                            child: IconButton(
                              icon: Icon(
                                _isRecording ? Icons.stop : Icons.mic,
                                color: Colors.white,
                                size: 22,
                              ),
                              onPressed: () {
                                if (_isRecording) {
                                  _toggleRecording();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Hold to record voice message'),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    : Material(
                        elevation: 2,
                        shape: const CircleBorder(),
                        color: Theme.of(context).colorScheme.primary,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(2),
                          child: IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 22,
                            ),
                            onPressed: _handleSendMessage,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Build a button for the attachments menu
  Widget _buildAttachmentButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  /// Build the recording indicator
  Widget _buildRecordingIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade100
            : Theme.of(context).colorScheme.surface.withOpacity(0.6),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.mic,
            color: Colors.red,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Recording...',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
          const SizedBox(
            width: 40,
            child: LinearProgressIndicator(
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
