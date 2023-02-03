import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/authentication/widgets/username_screen.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final String movePage;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.movePage,
  });

  // set Function
  void _onTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => _pushScreen(),
    ));
  }

  _pushScreen() {
    switch (movePage) {
      case "email":
        return const UserNameScreen();
    }
  }
  // finish set Function

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(Sizes.size14),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey.shade200,
            width: Sizes.size2,
          )),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: Sizes.size16, fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              )
            ],
          ),
        ),
      ),
    );
  }
}
