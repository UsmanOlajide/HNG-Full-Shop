// import 'package:flutter/material.dart';
// import 'package:hype_kicks/colors.dart';
// import 'package:hype_kicks/data/home_repository.dart';
// import 'package:hype_kicks/services/database_service.dart';

// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   final _dbService = DatabaseService.instance;
//   // void addShoe() {
//   //   _dbService.addShoe('theContent');
//   //   // print('object');
//   // }

//   String? _task = null;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: homeRepo.fetchShoes(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final snap = snapshot.data!;
//           }
//           return Container();
//           // return const Center(
//           //   child: Text('Loading'),
//           // );
//           // return Center(
//           //   child: Column(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     children: [
//           //       // Container(
//           //       //   height: 200,
//           //       //   margin: const EdgeInsets.only(bottom: 10.0),
//           //       //   padding: const EdgeInsets.all(10.0),
//           //       //   decoration: BoxDecoration(
//           //       //     color: gray50,
//           //       //     borderRadius: BorderRadius.circular(8.0),
//           //       //     image: DecorationImage(
//           //       //       image: NetworkImage(snap[13].photoUrls.first),
//           //       //     ),
//           //       //   ),
//           //       //   // child: Text(snap[13].),
//           //       // ),
//           //       // Text(snap[13].name)
//           //       const TextField(),
//           //       ElevatedButton(
//           //           onPressed: () {
//           //             if (_task == null || _task == '') return;
//           //             _dbService.addTask(_task);
//           //             setState(() {
//           //               _task == null;
//           //             });
//           //           },
//           //           child: const Text('Press'))
//           //     ],
//           //   ),
//           // );
//         },
//       ),
//       bottomSheet: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Container(
//             //   height: 200,
//             //   margin: const EdgeInsets.only(bottom: 10.0),
//             //   padding: const EdgeInsets.all(10.0),
//             //   decoration: BoxDecoration(
//             //     color: gray50,
//             //     borderRadius: BorderRadius.circular(8.0),
//             //     image: DecorationImage(
//             //       image: NetworkImage(snap[13].photoUrls.first),
//             //     ),
//             //   ),
//             //   // child: Text(snap[13].),
//             // ),
//             // Text(snap[13].name)
//             TextField(
//               onChanged: (v) {
//                 _task = v;
//               },
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   if (_task == null || _task == '') return;
//                   _dbService.addTask(_task!);
//                   setState(() {
//                     // _task == null;
//                   });
//                 },
//                 child: const Text('Press'))
//           ],
//         ),
//       ),
//     );
//   }
// }
