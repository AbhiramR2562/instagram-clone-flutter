import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_tutorial/pages/add_post_page.dart';
import 'package:instagram_tutorial/pages/feed_page.dart';
import 'package:instagram_tutorial/pages/profile_page.dart';
import 'package:instagram_tutorial/pages/search_page.dart';

const webPageSize = 600;

List<Widget> homePageItems = [
  FeedPage(),
  SearchPage(),
  AddPostPage(),
  Center(child: Text('Like Page')),
  ProfilePage(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
