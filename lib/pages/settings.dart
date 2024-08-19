import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(7, 40, 10, 30),
        padding: const EdgeInsets.fromLTRB(4.2, 3.3, 3.5, 1.4),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFbcebf0),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 0.4,
              blurRadius: 0.4,
              offset: const Offset(0, 0.4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.fromLTRB(5, 3, 23, 5),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('Assets/login.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 0.2),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    height: 4.23, // Equivalent to lineHeight
                    overflow: TextOverflow.ellipsis,
      
                  ),
                ),
                SizedBox(height: 0.3),
                Text(
                  'Tap here to check your profile and edit',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0.2,
                    overflow: TextOverflow.ellipsis,
      
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class RoundedContainer extends StatelessWidget {
  final String text;

  const RoundedContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        width:180,
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.green[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              height: 0.5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileInfo(),
        RoundedContainer(text: 'My Orders'),
        RoundedContainer(text: 'Help & Support'),
        RoundedContainer(text: 'About us'),
        RoundedContainer(text: 'Sign Out'),
      ],
    );
  }
}
