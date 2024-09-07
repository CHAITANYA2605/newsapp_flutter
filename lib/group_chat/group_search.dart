import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_app/group_chat_screen.dart'; // Import GroupChatScreen

class GroupSearchScreen extends StatefulWidget {
  @override
  _GroupSearchScreenState createState() => _GroupSearchScreenState();
}

class _GroupSearchScreenState extends State<GroupSearchScreen> {
  final SearchBar searchBar = SearchBar(
    hintText: 'Search for groups',
    onSubmitted: (value) {
      // Handle search results here
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('groups').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final groups = snapshot.data!.docs;
            return ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, index) {
                final groupData = groups[index].data() as Map<String, dynamic>;
                final group = GroupModel.fromMap(groupData);
                return ListTile(
                  title: Text(group.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroupChatScreen(groupId: groups[index].id),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement create group functionality
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
