import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_tutorial/utils/colors.dart';
import 'package:instagram_tutorial/widgets/post_card.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Image.asset(
          'assets/instagram-log-white.png',
          height: 32,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => PostCard(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
