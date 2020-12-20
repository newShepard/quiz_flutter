import 'package:flutter/material.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/services/auth_service.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = sl<AuthService>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Profile"),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: RaisedButton(
              onPressed: () async {
                await auth.signOut();
              },
              child: Text("Выйти"),
            ),
          )
        ],
      ),
    );
  }
}
