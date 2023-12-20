import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_tutorial/utils/colors.dart';
import 'package:instagram_tutorial/utils/gloabal_variables.dart';
import 'package:instagram_tutorial/widgets/post_card.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          width > webPageSize ? webBackgroundColor : mobileBackgroundColor,
      appBar: width > webPageSize
          ? null
          : AppBar(
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
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy(
              'datePublished',
              descending: true,
            )
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width > webPageSize ? width * 0.3 : 0,
                  vertical: width > webPageSize ? 15 : 0),
              child: PostCard(
                snap: snapshot.data!.docs[index].data(),
              ),
            ),
          );
        },
      ),
    );
  }
}
