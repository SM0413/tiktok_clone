import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  String _text = "";

  List<String> myTextList = [];

  final TextEditingController _textEditingController = TextEditingController();

  void _onEditingComplete() {
    if (_text.isNotEmpty) {
      myTextList.add(_text);
      FocusScope.of(context).unfocus();
      _textEditingController.clear();
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: Sizes.size8,
            leading: Stack(
              children: [
                const CircleAvatar(
                  radius: Sizes.size24,
                  foregroundImage: NetworkImage(
                      "https://wallpapers.com/images/featured/4co57dtwk64fb7lv.jpg"),
                  child: Text("Nico"),
                ),
                Positioned(
                  width: 20,
                  right: 0,
                  bottom: 0,
                  height: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: Sizes.size4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            title: const Text(
              "Nico",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text("active now"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FaIcon(
                  FontAwesomeIcons.flag,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
                Gaps.h32,
                FaIcon(
                  FontAwesomeIcons.ellipsis,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
              ],
            ),
          ),
        ),
        body: Container(
          color: Colors.grey.shade200,
          child: Stack(
            children: [
              ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size14,
                ),
                itemBuilder: (context, index) {
                  final isMine = index % 2 == 0 ? true : false;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isMine
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(
                          Sizes.size14,
                        ),
                        decoration: BoxDecoration(
                          color: isMine
                              ? Colors.blue
                              : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(Sizes.size20),
                            topRight: const Radius.circular(Sizes.size20),
                            bottomLeft: Radius.circular(
                              isMine ? Sizes.size20 : Sizes.size5,
                            ),
                            bottomRight: Radius.circular(
                              isMine ? Sizes.size5 : Sizes.size20,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            if (_text.isNotEmpty)
                              for (var text in myTextList)
                                Text(
                                  text,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Gaps.v10,
                itemCount: myTextList.length,
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: BottomAppBar(
                  elevation: 0,
                  color: Colors.grey.shade200,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  Sizes.size20,
                                ),
                                topLeft: Radius.circular(
                                  Sizes.size20,
                                ),
                                topRight: Radius.circular(
                                  Sizes.size20,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _textEditingController,
                              onChanged: (value) => _text = value,
                              onEditingComplete: _onEditingComplete,
                              onSubmitted: (value) => _onEditingComplete,
                              decoration: InputDecoration(
                                hintText: "Send a message...",
                                labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.only(
                                    top: Sizes.size10,
                                  ),
                                  child: FaIcon(
                                    FontAwesomeIcons.faceLaugh,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: const FaIcon(
                          FontAwesomeIcons.paperPlane,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
