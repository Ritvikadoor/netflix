// import 'package:flutter/material.dart';

// import '../../../core/colors/colors.dart';
// import '../../../core/constnts.dart';
// import '../../home/widgets/custom_button.dart';

// class EveryonsWatchingWidget extends StatelessWidget {
//   EveryonsWatchingWidget({Key? key, })
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         kHieght,
//         const Text(
//           'Friends',
//           style: TextStyle(
//             fontSize: 40,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const Text(
//           'Martial law is declared when a mysterious viral outbreak pushes Korea into a state of emergency. Those on an express train to Busan, a city that has successfully fended off the viral outbreak, must fight for their own survival…',
//           style: TextStyle(color: greyColor),
//         ),
//         kHieght50,
//         Stack(
//           children: [
//             SizedBox(
//               height: 200,
//               width: double.infinity,
//               child: Image.network(
//                 "${widget.listmovie[index].backdropPath}",
//                 fit: BoxFit.contain,
//               ),
//             ),
//             Positioned(
//               bottom: 10,
//               right: 10,
//               child: CircleAvatar(
//                 backgroundColor: Colors.black.withOpacity(0.7),
//                 radius: 20,
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.volume_off,
//                     color: kWhiteColor,
//                     size: 20,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         kHieght,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: const [
//             CustomAddButton(
//               icon: Icons.info,
//               title: "Share",
//               iconSize: 24,
//               textSize: 16,
//             ),
//             kWdith,
//             CustomAddButton(
//               icon: Icons.add,
//               title: "My List",
//               iconSize: 24,
//               textSize: 16,
//             ),
//             kWdith,
//             CustomAddButton(
//               icon: Icons.play_arrow,
//               title: "Remind me",
//               iconSize: 24,
//               textSize: 16,
//             ),
//             kWdith,
//           ],
//         )
//       ],
//     );
//   }
// }
