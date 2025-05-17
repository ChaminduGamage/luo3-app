import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/theme/colors.dart';

class ChatOpenPage extends StatefulWidget {
  final String name;
  final String role;
  final String? imageUrl;

  const ChatOpenPage({
    super.key,
    required this.name,
    required this.role,
    this.imageUrl,
  });

  @override
  State<ChatOpenPage> createState() => _ChatOpenPageState();
}

class _ChatOpenPageState extends State<ChatOpenPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {"text": "Hi, how can I help you?", "isUser": false},
  ];

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({"text": message, "isUser": true});
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Luo3Colors.scaffoldColor,
        body: Column(
          children: [
            // Top Bar with Profile Details
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/default-home');
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Luo3Colors.textPrimary,
                          width: 2,
                        ),
                      ),
                      child: const Icon(Icons.arrow_back,
                          color: Luo3Colors.textPrimary),
                    ),
                  ),
                  const SizedBox(width: 50),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Luo3Colors.inputBackground,
                    backgroundImage: widget.imageUrl != null
                        ? NetworkImage(widget.imageUrl!)
                        : null,
                    child: widget.imageUrl == null
                        ? const Icon(Icons.person, color: Luo3Colors.primary)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                      Text(
                        widget.role,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Luo3Colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Chat Messages
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message['isUser']
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                      decoration: BoxDecoration(
                        color: message['isUser']
                            ? Luo3Colors.primary.withOpacity(0.9)
                            : Luo3Colors.inputBackground,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(14),
                          topRight: const Radius.circular(14),
                          bottomLeft:
                              Radius.circular(message['isUser'] ? 14 : 0),
                          bottomRight:
                              Radius.circular(message['isUser'] ? 0 : 14),
                        ),
                      ),
                      child: Text(
                        message['text'],
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: message['isUser']
                              ? Colors.white
                              : Luo3Colors.textPrimary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Message Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Luo3Colors.inputBackground,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        controller: _messageController,
                        style: GoogleFonts.inter(fontSize: 15),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type your message...",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Luo3Colors.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.send, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
