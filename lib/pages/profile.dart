import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Card(
                  color: Color(0xFFbcebf0),
                  elevation: 5,
                  child: ListTile(
                    title: Text('Shreyas', style: TextStyle()),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('abc@gmail.com'),
                        Row(
                          children: <Widget>[
                            Text(
                              'View dineline',
                              style: TextStyle(
                                color: Colors.pinkAccent,
                              ),
                            ),
                            Icon(Icons.arrow_right, color: Colors.pink)
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    trailing: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://avatars1.githubusercontent.com/u/60895972?s=460&v=4'),
                    ),
                  ),
                ),
                const Divider(),
                Container(
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(13, 20, 13, 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.tealAccent[100],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.bookmark),
                          SizedBox(height: 8),
                          Text(
                            'Bookmarks',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.23,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.notifications),
                          SizedBox(height: 8),
                          Text(
                            'Notifications',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.23,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.settings),
                          SizedBox(height: 8),
                          Text('Settings',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.23, // Equivalent to lineHeight
                              overflow: TextOverflow.ellipsis,
                            ),)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.payment),
                          SizedBox(height: 8),
                          Text('Payments',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.23, // Equivalent to lineHeight
                              overflow: TextOverflow.ellipsis,
                            ),)
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // const Text(
                //   'Food Orders',
                //   style: TextStyle(
                //     fontSize: 10,
                //   ),
                // ),
                // Give all cards after "Food Orders" a green background and box shadow
                const Card(
                  color: Colors.tealAccent,
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  surfaceTintColor: Colors.lightGreen,
                  child: ListTile(
                    leading: Icon(Icons.shopping_bag, color: Colors.black),
                    title: Text(
                      'Your Orders',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.23, // Equivalent to lineHeight
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                const Card(
                  color: Colors.tealAccent,
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  surfaceTintColor: Colors.lightGreen,
                  child: ListTile(
                    leading: Icon(Icons.favorite, color: Colors.black),
                    title: Text(
                      'Favorite Orders',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.23, // Equivalent to lineHeight
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                // const Card(
                //   color: Colors.tealAccent,
                //   elevation: 3,
                //   surfaceTintColor: Colors.lightGreen,
                //   child: ListTile(
                //     leading: Icon(Icons.book, color: Colors.black),
                //     title: Text(
                //       'Address Book',
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontFamily: 'Inter',
                //         fontSize: 12,
                //         fontWeight: FontWeight.w500,
                //         height: 1.23, // Equivalent to lineHeight
                //         overflow: TextOverflow.ellipsis,
                //       ),
                //     ),
                //     trailing: Icon(Icons.keyboard_arrow_right),
                //   ),
                // ),
                // const Card(
                //   color: Colors.tealAccent,
                //   elevation: 3,
                //   surfaceTintColor: Colors.lightGreen,
                //   child: ListTile(
                //     leading: Icon(Icons.message, color: Colors.black),
                //     title: Text(
                //       'Online Ordering Help',
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontFamily: 'Inter',
                //         fontSize: 12,
                //         fontWeight: FontWeight.w500,
                //         height: 1.23, // Equivalent to lineHeight
                //         overflow: TextOverflow.ellipsis,
                //       ),
                //     ),
                //     trailing: Icon(Icons.keyboard_arrow_right),
                //   ),
                // ),
                const Divider(),
                // const Divider(),
                // const Text(
                //   'Table Bookings',
                //   style: TextStyle(
                //     fontSize: 10,
                //   ),
                // ),
                const Card(
                  color: Colors.tealAccent,
                  elevation: 5,
                  surfaceTintColor: Colors.lightGreen,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: ListTile(
                    leading: Icon(Icons.calendar_month, color: Colors.black),
                    title: Text(
                      'Your Bookings',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.23, // Equivalent to lineHeight
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                const Card(
                  color: Colors.tealAccent,
                  elevation: 3,
                  surfaceTintColor: Colors.lightGreen,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: ListTile(
                    leading: Icon(Icons.message, color: Colors.black),
                    title: Text(
                      'Help',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.23, // Equivalent to lineHeight
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                const Divider(),
                const Card(
                  color: Colors.tealAccent,
                  elevation: 3,
                  surfaceTintColor: Colors.lightGreen,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: ListTile(
                    title: Text(
                      'Send Feedback',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.23, // Equivalent to lineHeight
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                const Card(
                  color: Colors.tealAccent,
                  elevation: 3,
                  surfaceTintColor: Colors.transparent,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: ListTile(
                    title: Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.23, // Equivalent to lineHeight
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
