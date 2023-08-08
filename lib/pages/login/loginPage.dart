import 'package:egitimax/models/common/userData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? username = Provider.of<UserData>(context).username;
    BigInt? userId = Provider.of<UserData>(context).userId;

    return Center(
      child: Column(
        children: [
          Text('Username: $username',style: TextStyle(fontSize: 14),),
          Text('UserId: $userId',style: TextStyle(fontSize: 14),),
          ElevatedButton(
            onPressed: () {
              Provider.of<UserData>(context, listen: false).setUsernameAndId("admin",BigInt.parse('2'));
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
