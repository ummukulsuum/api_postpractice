
// import 'dart:developer';

// import 'package:api/model.dart';
// import 'package:api/service.dart';
// import 'package:flutter/material.dart';

// class Home2 extends StatefulWidget {
//   const Home2({super.key});

//   @override
//   State<Home2> createState() => _Home2State();
// }

// class _Home2State extends State<Home2> {
//   UserModel? user;
//   @override
//   void initState() {
   
//     // TODO: implement initState
//     super.initState();
//      getUser();
//   }
//   void getUser() async {
//     final usermode = await ApiService().getUser();
//     log(usermode?.email ?? 'email not found');
//         setState(() {
//       user = usermode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text(user?.email ?? 'email not found')),
//     );
//   }
// }
import 'package:api/model.dart';
import 'package:api/service.dart';
import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  final String token;

  const Home2({super.key, required this.token});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    final data = await ApiService().getUser(widget.token);

    setState(() {
      user = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(user?.email ?? "email not found"),
      ),
    );
  }
}
