import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/discover/discover_screen.dart';
import 'package:tictok_clone/screens/features/inbox/inbox_screen.dart';
import 'package:tictok_clone/common/widgets/main_navigation/widgets/nav_tap.dart';
import 'package:tictok_clone/common/widgets/main_navigation/widgets/post_video_button.dart';
import 'package:tictok_clone/screens/features/users/user_profile_screen.dart';
import 'package:tictok_clone/screens/features/videos/views/video_recording_screen.dart';
import 'package:tictok_clone/screens/features/videos/views/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;
  const MainNavigationScreen({super.key, required this.tab});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "discover",
    "xxx",
    "inbox",
    "profile",
  ];
  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    context.pushNamed(VideoRecordingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(
              username: "Nico",
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(
            Sizes.size12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTap(
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                text: "Home",
                isSelected: _selectedIndex == 0,
                onTap: () => _onTap(0),
                selectedIndex: _selectedIndex,
              ),
              NavTap(
                selectedIcon: FontAwesomeIcons.solidCompass,
                icon: FontAwesomeIcons.compass,
                text: "Discover",
                isSelected: _selectedIndex == 1,
                onTap: () => _onTap(1),
                selectedIndex: _selectedIndex,
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: PostVideoButton(
                  inverted: _selectedIndex != 0,
                ),
              ),
              Gaps.h24,
              NavTap(
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                onTap: () => _onTap(3),
                selectedIndex: _selectedIndex,
              ),
              NavTap(
                selectedIcon: FontAwesomeIcons.solidUser,
                icon: FontAwesomeIcons.user,
                text: "Profile",
                isSelected: _selectedIndex == 4,
                onTap: () => _onTap(4),
                selectedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
