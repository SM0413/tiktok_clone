import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/function/avatarURL.dart';
import 'package:tictok_clone/screens/features/inbox/chat_detail_screen.dart';

class CahtsScreen extends StatefulWidget {
  static const String routeName = "chats";
  static const String routeURL = "/chats";
  const CahtsScreen({super.key});

  @override
  State<CahtsScreen> createState() => _CahtsScreenState();
}

class _CahtsScreenState extends State<CahtsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  final List<int> _items = [];

  final Duration _duration = const Duration(
    milliseconds: 300,
  );
  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(
        _items.length,
        duration: _duration,
      );

      _items.add(_items.length);
    }
  }

  Widget _makeTile(int index) {
    return ListTile(
      onTap: () => _onChatTap(index),
      onLongPress: () => _deleteItem(index),
      key: UniqueKey(),
      leading: CircleAvatar(
        radius: 30,
        foregroundImage: NetworkImage(avatarURL()),
        child: const Text("Nico"),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "AntonioBM ($index)",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "2:16 PM",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: Sizes.size12,
            ),
          ),
        ],
      ),
      subtitle: const Text("Say hi to AntonioBM"),
    );
  }

  void _deleteItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: Container(
            color: Colors.red,
            child: _makeTile(index),
          ),
        ),
        duration: _duration,
      );
      _items.remove(index);
    }
  }

  void _onChatTap(int chatIndex) {
    context.pushNamed(
      ChatDetailScreen.routeName,
      params: {
        "chatId": "$chatIndex",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Direct messages"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(FontAwesomeIcons.plus),
            splashColor: Colors.transparent,
            enableFeedback: true,
          ),
        ],
      ),
      body: AnimatedList(
        key: _key,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        itemBuilder: (context, int index, animation) {
          return FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              child: _makeTile(index),
            ),
          );
        },
      ),
    );
  }
}
