import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateUsernameView extends StatelessWidget {
  const CreateUsernameView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Home View'),
        ),
      ),
    );
  }
}
