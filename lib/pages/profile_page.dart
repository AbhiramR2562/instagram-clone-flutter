import 'package:flutter/material.dart';
import 'package:instagram_tutorial/utils/colors.dart';
import 'package:instagram_tutorial/widgets/follow_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text("username"),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1627693685101-687bf0eb1222?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                      radius: 40,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildstatColumn(44, 'posts'),
                              buildstatColumn(1074, 'followers'),
                              buildstatColumn(657, 'following'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FollowButton(
                                backgroundColor: mobileBackgroundColor,
                                borderColor: Colors.grey,
                                text: 'Edit Profile',
                                textColor: primaryColor,
                                function: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //-> Username
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Text(
                    'username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // -> Descreption
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    top: 2,
                  ),
                  child: Text(
                    'Description',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildstatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
