import 'package:flutter/material.dart';

deleteChat(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Are you sure to delete this chat?"),
        actions: <Widget>[
          FlatButton(
            child: Text("No"),
            onPressed: () {},
            // color: Colors.green[200],
          ),
          FlatButton(
            child: Text("Yes"),
            onPressed: () {},
          ),
        ],
      );
    },
  );
}

showChatOptions(context) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    builder: (context) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.delete_forever),
            title: Text('Delete Forever'),
            onTap: () {
              Navigator.pop(context);
              deleteChat(context);
            },
          )
        ],
      );
    },
  );
}
