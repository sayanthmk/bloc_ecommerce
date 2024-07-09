import 'package:datapage_bloc/view/login_page/loginpage.dart';
import 'package:datapage_bloc/view/profile/profile_container.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('asset/billy butcher.webp'),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomContainer(text: 'John Dexter'),
              const SizedBox(
                height: 10,
              ),
              const CustomContainer(text: 'Columbia'),
              const SizedBox(
                height: 10,
              ),
              const CustomContainer(text: 'Settings'),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text('Are you sure you want to logout?'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setBool('isLoggedIn', false);
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  height: 70,
                  width: 350,
                  child: const Center(
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));

    // Stack(
    //   children: [
    //     Container(
    //       decoration: const BoxDecoration(color: Colors.grey),
    //       height: 180,
    //       width: double.infinity,
    //       // child: Image.asset(
    //       //   'asset/background_ui.jpeg',
    //       //   fit: BoxFit.fill,
    //       // ),
    //     ),
    //     SizedBox(
    //       height: double.infinity,
    //       width: double.infinity,
    //       child:
    //     ),
    //     const Positioned(
    //         top: 90,
    //         left: 110,
    //         child: CircleAvatar(
    //           radius: 80,
    //         )),
    //   ],
    // ));
  }
}
//  child: Container(
//             height: 250,
//             width: 350,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   height: 60,
//                   width: 200,
//                   color: Colors.amber,
//                   child: Image.asset(
//                     'asserts/images/dukaan_premium_1.jpg',
//                   ),
//                 ),
//                 Text('Get Dukaan Premium for just')
//               ],
//             ),
//           ),
//     actions: [
//   IconButton(
//     onPressed: () {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Logout'),
//             content: const SingleChildScrollView(
//               child: ListBody(
//                 children: [
//                   Text('Are you sure you want to logout?'),
//                 ],
//               ),
//             ),
//             actions: [
//               TextButton(
//                 child: const Text(
//                   'Cancel',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                 child: const Text(
//                   'Logout',
//                   style: TextStyle(
//                     color: Colors.red,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 onPressed: () async {
//                   final prefs = await SharedPreferences.getInstance();
//                   await prefs.setBool('isLoggedIn', false);
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                         builder: (context) => LoginScreen()),
//                   );
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     },
//     icon: const Icon(Icons.logout),
//   ),
// ],
