// import 'package:api/home2.dart';
// import 'package:api/model.dart';
// import 'package:api/service.dart';
// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController email = TextEditingController();
//     TextEditingController password = TextEditingController();

//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextField(controller: email),
//           TextField(controller: password),
//           ElevatedButton(
//             onPressed: () async {
//               final UserModel datas = UserModel(
//                 email: email.text,
//                 password: password.text,
//               );
//               final respo = await ApiService().createUse(datas);
//               if (respo != null) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Home2()),
//                 );
//               }
//             },
//             child: Text("done"),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:api/home2.dart';
import 'package:api/model.dart';
import 'package:api/service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: email),
          TextField(controller: password),
          ElevatedButton(
            onPressed: () async {
              final user = UserModel(
                email: email.text,
                password: password.text,
              );

              final token = await ApiService().login(user);

              if (token != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home2(token: token),
                  ),
                );
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
