import 'package:flutter/material.dart';
import 'package:simple_listshop/content/login.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              child: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pinimg.com/736x/af/c5/f2/afc5f2d6d1af3b36c26323cf3b90566b.jpg'),
                  radius: 65,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 20),
            ),
            Container(
              child: Text("Nemuru Takachi",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Roboto',
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(top: 15),
            ),
            Container(
              child: Text("ntakachi73@gmail.com",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300
              ),
              textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(top: 5),
            ),
            Container(
              padding: EdgeInsets.only(right: 190),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextButton.icon(
                onPressed: () {  },
                icon: Icon(
                  Icons.privacy_tip_outlined,
                  color: Colors.black,
                  size: 20,
                ),
                label: Text("\t\tPrivacy",
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 130),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.history,
                  color: Colors.black,
                  size: 20,
                ),
                label: Text(
                  "\t\tPurchase History",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 143),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.help_outline_rounded,
                  color: Colors.black,
                  size: 20,
                ),
                label: Text(
                  "\t\tHelp & Support",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 186),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.settings_outlined,
                  color: Colors.black,
                  size: 20,
                ),
                label: Text(
                  "\t\tSettings",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 147),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.group_add_outlined,
                  color: Colors.black,
                  size: 20,
                ),
                label: Text(
                  "\t\tInvite a Friend",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 188),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginPage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                  size: 20,
                ),
                label: Text(
                  "\t\tLog Out",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}