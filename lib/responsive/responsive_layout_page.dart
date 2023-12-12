import 'package:flutter/material.dart';
import 'package:instagram_tutorial/providers/user_provider.dart';
import 'package:instagram_tutorial/utils/gloabal_variables.dart';
import 'package:provider/provider.dart';

class ResponsiveLayoutPage extends StatefulWidget {
  final Widget webPageLayout;
  final Widget mobilePageLayout;
  const ResponsiveLayoutPage({
    super.key,
    required this.webPageLayout,
    required this.mobilePageLayout,
  });

  @override
  State<ResponsiveLayoutPage> createState() => _ResponsiveLayoutPageState();
}

class _ResponsiveLayoutPageState extends State<ResponsiveLayoutPage> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webPageSize) {
          // Web screen
          return widget.webPageLayout;
        }
        // mobile screen
        return widget.mobilePageLayout;
      },
    );
  }
}
