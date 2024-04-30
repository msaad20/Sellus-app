import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: ()async{
    await FirebaseAuth.instance.signOut();
        }, child: Text('ss'))
      ],
    );
  }
}
