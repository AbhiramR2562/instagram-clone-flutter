import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_tutorial/pages/comments_page.dart';
import 'package:instagram_tutorial/pages/login_page.dart';
import 'package:instagram_tutorial/pages/register_page.dart';
import 'package:instagram_tutorial/providers/user_provider.dart';
import 'package:instagram_tutorial/responsive/mobile_page_layout.dart';
import 'package:instagram_tutorial/responsive/responsive_layout_page.dart';
import 'package:instagram_tutorial/responsive/web_page_layout.dart';
import 'package:instagram_tutorial/utils/colors.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'I N S T A G R A M',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                const ResponsiveLayoutPage(
                  webPageLayout: WebPageLayout(),
                  mobilePageLayout: MobilePageLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return CommentsPage();
          },
        ),
      ),
    );
  }
}
