import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tictok_clone/screens/features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: const Text("AutoMuted"),
            value: context.watch<PlaybackConfigViewModel>().muted,
            onChanged: (value) =>
                context.read<PlaybackConfigViewModel>().setMuted(value),
            subtitle: const Text("Video will be Muted by default"),
          ),
          SwitchListTile.adaptive(
            title: const Text("AutoPlay"),
            value: context.watch<PlaybackConfigViewModel>().autoplay,
            onChanged: (value) =>
                context.read<PlaybackConfigViewModel>().setAutoplay(value),
            subtitle: const Text("Video will be Autoplay by default"),
          ),
          SwitchListTile.adaptive(
            title: const Text("Enable notifications"),
            value: _notifications,
            onChanged: _onNotificationsChanged,
            subtitle: const Text("subTitle"),
          ),
          CheckboxListTile(
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: const Text(
              "Enable notifications",
            ),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1800),
                lastDate: DateTime.now(),
              );
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(1800),
                    lastDate: DateTime(3000),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData(
                          appBarTheme: const AppBarTheme(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black),
                        ),
                        child: child!,
                      );
                    },
                  );
                }
              }
            },
            title: const Text("What is your birthDay"),
          ),
          ListTile(
            title: const Text("Logout (ios)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Please dont go"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("NO"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("YES"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Logout (android)"),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
                  title: const Text("Are you sure?"),
                  content: const Text("Please dont go"),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const FaIcon(
                        FontAwesomeIcons.backward,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("YES"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Logout (ios / bottom)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("Are you sure?"),
                  message: const Text("Please dont go!"),
                  actions: [
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Not log out"),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          const AboutListTile(
            applicationVersion: "1.0",
            applicationIcon: Icon(Icons.settings_applications),
            applicationLegalese: "This is Tiktok clone",
          ),
        ],
      ),
    );
  }
}
