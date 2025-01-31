import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/receivers/dialog_receiver.dart';
import 'package:sorting_hat/ui/dialogs/no_connection_dialog.dart';
import 'package:sorting_hat/ui/pages/home_page.dart';
import 'package:sorting_hat/ui/pages/list_page.dart';
import 'package:sorting_hat/ui/widgets/common_appbar.dart';

class MainLayout extends ConsumerStatefulWidget {
  final Widget child;
  final String title;
  final int currentScreenNo;

  const MainLayout({
    required this.child,
    required this.title,
    required this.currentScreenNo,
    super.key,
  });

  @override
  ConsumerState<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  late final StreamSubscription<DialogEvent> _dialogReceiverSubscription;

  @override
  void initState() {
    _dialogReceiverSubscription = dialogReceiver.listen((value) {
      Navigator.of(context).push(NoConnectionDialog.noNoConnectionDialogBuilder(context));
    });

    super.initState();
  }

  @override
  void dispose() {
    _dialogReceiverSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: CommonAppbar(
          title: widget.title,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: widget.child,
        ),
        bottomNavigationBar: AppNavigationBar(
          currentScreenNo: widget.currentScreenNo,
        ),
      ),
    );
  }
}

class AppNavigationBar extends StatelessWidget {
  final int currentScreenNo;

  const AppNavigationBar({super.key, required this.currentScreenNo});

  static List<Destination> destinations = <Destination>[
    const Destination(
        0,
        'Home',
        Icon(
          Icons.home,
        ),
        HomePage.id),
    const Destination(1, 'List', Icon(Icons.list), ListPage.id),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all<TextStyle>(Theme.of(context).textTheme.bodyMedium!),
      ),
      child: Container(
        height: 60,
        decoration:
            const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.black, width: 2.0))),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            if (index != currentScreenNo) {
              Navigator.of(context).pushReplacementNamed(AppNavigationBar.destinations[index].routeName);
            }
          },
          backgroundColor: Colors.white,
          indicatorColor: Colors.transparent,
          destinations: <Widget>[
            ...AppNavigationBar.destinations.map((e) => NavigationDestination(icon: e.icon, label: e.title))
          ],
        ),
      ),
    );
  }
}

class Destination {
  const Destination(this.index, this.title, this.icon, this.routeName);

  final int index;
  final String title;
  final Widget icon;
  final String routeName;
}
