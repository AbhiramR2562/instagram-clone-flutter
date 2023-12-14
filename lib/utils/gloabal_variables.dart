import 'package:flutter/material.dart';
import 'package:instagram_tutorial/pages/add_post_page.dart';
import 'package:instagram_tutorial/pages/feed_page.dart';
import 'package:instagram_tutorial/pages/search_page.dart';

const webPageSize = 600;

const homePageItems = [
  FeedPage(),
  SearchPage(),
  AddPostPage(),
  Center(child: Text('Like Page')),
  Center(child: Text('Profile Page')),
];
