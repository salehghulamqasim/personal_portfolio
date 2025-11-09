// import 'package:flutter/material.dart';

// class ItemScreen extends StatelessWidget {
//   const ItemScreen({super.key});

//   static List<ItemModel> items = [
//     ItemModel(title: 'this first image', image: 'assets/image/task.jpg'),
//     ItemModel(title: 'this second image', image: 'assets/image/task.jpg'),
//     ItemModel(title: 'this three image', image: 'assets/image/task.jpg'),
//     ItemModel(title: 'this four image', image: 'assets/image/task.jpg'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 48.0),
//         child: CustomScrollView(
//           slivers: [
//             SliverGrid.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 childAspectRatio: 1.3,
//               ),
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DetailScreen(item: items[index]),
//                       ),
//                     );
//                   },
//                   child: CustomItemWidget(item: items[index]),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DetailScreen extends StatelessWidget {
//   const DetailScreen({super.key, required this.item});

//   final ItemModel item;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 40),
//         child: Card(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(8),
//                     topRight: Radius.circular(8),
//                   ),
//                   image: DecorationImage(
//                     image: AssetImage(item.image),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 height: MediaQuery.sizeOf(context).height * .5,
//               ),
//               Align(
//                 alignment: AlignmentDirectional.topEnd,
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.close, size: 30, color: Colors.black),
//                 ),
//               ),
//               Text(item.title),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ItemModel {
//   final String title;
//   final String image;

//   ItemModel({required this.title, required this.image});
// }

// class CustomItemWidget extends StatelessWidget {
//   const CustomItemWidget({super.key, required this.item});

//   final ItemModel item;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //color: Colors.red,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Image.asset(
//               item.image,
//               fit: BoxFit.cover,
//               width: double.infinity,
//             ),
//           ),
//           Padding(padding: const EdgeInsets.all(8.0), child: Text(item.title)),
//         ],
//       ),
//     );
//   }
// }
