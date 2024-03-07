// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class PostDatatoFirebase extends StatelessWidget {
//   const PostDatatoFirebase({super.key});

//   // Function to post data to Firestore
//   Future<void> postData() async {
//     try {
//       // Initialize Firestore
//       FirebaseFirestore firestore = FirebaseFirestore.instance;

//       // Document reference
//       DocumentReference bankDocRef =
//           firestore.collection('get_collage').doc('jnMbXRc8PjpJviFgat5q');

//       // Data to be posted
//       Map<String, dynamic> postData = {
//     "status": 1,
//     "count": 218,
//     "message": "Fetched Successfully!",
//     "data": [
//         {
//             "id": 1,
//             "name": "Adi Shankara College of Engineering",
//             "short_name": null,
//             "is_private": false,
//             "area_id": null,
//             "landmark": null,
//             "coordinates": null,
//             "comments": null,
//             "active": true,
//             "created_at": "2023-10-11T23:36:05.000000Z",
//             "updated_at": null,
//             "deleted_at": null
//         },
//         {
//             "id": 2,
//             "name": "Adi Shankara Institute of Engineering and Technology, Kalady",
//             "short_name": null,
//             "is_private": false,
//             "area_id": null,
//             "landmark": null,
//             "coordinates": null,
//             "comments": null,
//             "active": true,
//             "created_at": "2023-10-11T23:36:05.000000Z",
//             "updated_at": null,
//             "deleted_at": null
//         },
//         {
//             "id": 3,
//             "name": "Al Ameen College, Edathala",
//             "short_name": null,
//             "is_private": false,
//             "area_id": null,
//             "landmark": null,
//             "coordinates": null,
//             "comments": null,
//             "active": true,
//             "created_at": "2023-10-11T23:36:05.000000Z",
//             "updated_at": null,
//             "deleted_at": null
//         },
//         {
//             "id": 4,
//             "name": "Al Ameen Collegem Edathala",
//             "short_name": null,
//             "is_private": false,
//             "area_id": null,
//             "landmark": null,
//             "coordinates": null,
//             "comments": null,
//             "active": true,
//             "created_at": "2023-10-11T23:36:05.000000Z",
//             "updated_at": null,
//             "deleted_at": null
//         },
//         {
//             "id": 5,
//             "name": "Al Azar College, Thodupuzha",
//             "short_name": null,
//             "is_private": false,
//             "area_id": null,
//             "landmark": null,
//             "coordinates": null,
//             "comments": null,
//             "active": true,
//             "created_at": "2023-10-11T23:36:05.000000Z",
//             "updated_at": null,
//             "deleted_at": null
//         },
//         {
//             "id": 6,
//             "name": "Al-A, Ameen College, Edathala",
//             "short_name": null,
//             "is_private": false,
//             "area_id": null,
//             "landmark": null,
//             "coordinates": null,
//             "comments": null,
//             "active": true,
//             "created_at": "2023-10-11T23:36:05.000000Z",
//             "updated_at": null,
//             "deleted_at": null
//         },
//         {
//             "id": 7,
//             "name": "Alphonsa College, Pala",
//             "short_name": null,
//             "is_private": false,
//             "area_id": null,
//             "landmark": null,
//             "coordinates": null,
//             "comments": null,
//             "active": true,
//             "created_at": "2023-10-11T23:36:05.000000Z",
//             "updated_at": null,
//             "deleted_at": null
//         },
//         {
//             "id": 8,
//             "name": "Amrita Institute",
//             "short_name": null,
//             "is_private": false,
//             "area_id": null,
//             "landmark": null,
//             "coordinates": null,
//             "comments": null,
//             "active": true,
//             "created_at": "2023-10-11T23:36:05.000000Z",
//             "updated_at": null,
//             "deleted_at": null
//         },
//         {
//             "id": 9,
//             "name": "B. Sc New Man College, Thodupuzha",
//             "short_name": null,
//             "is_private": false,
//             "area_id": null,
//             "landmark": null,
//             "coordinates": null,
//             "comments": null,
//             "active": true,
//             "created_at": "2023-10-11T23:36:05.000000Z",
//             "updated_at": null,
//             "deleted_at": null
//         },
//         {
//             "id": 10,
//             "name": "B.M College, Trikkakara",
//             "short_name": null,
//             "is_private": false,
//             "area_id": null,
//             "landmark": null,
//             "coordinates": null,
//             "comments": null,
//             "active": true,
//             "created_at": "2023-10-11T23:36:05.000000Z",
//             "updated_at": null,
//             "deleted_at": null
//         }
//     ],
//     "misc": [],
//     "paginate": {
//         "current_page": 1,
//         "first_page_url": "https://ptvue.tekpeak.in/api/collage?page=1",
//         "from": 1,
//         "last_page": 22,
//         "last_page_url": "https://ptvue.tekpeak.in/api/collage?page=22",
//         "links": [
//             {
//                 "url": null,
//                 "label": "&laquo; Previous",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=1",
//                 "label": "1",
//                 "active": true
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=2",
//                 "label": "2",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=3",
//                 "label": "3",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=4",
//                 "label": "4",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=5",
//                 "label": "5",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=6",
//                 "label": "6",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=7",
//                 "label": "7",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=8",
//                 "label": "8",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=9",
//                 "label": "9",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=10",
//                 "label": "10",
//                 "active": false
//             },
//             {
//                 "url": null,
//                 "label": "...",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=21",
//                 "label": "21",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=22",
//                 "label": "22",
//                 "active": false
//             },
//             {
//                 "url": "https://ptvue.tekpeak.in/api/collage?page=2",
//                 "label": "Next &raquo;",
//                 "active": false
//             }
//         ],
//         "next_page_url": "https://ptvue.tekpeak.in/api/collage?page=2",
//         "path": "https://ptvue.tekpeak.in/api/collage",
//         "per_page": 10,
//         "prev_page_url": null,
//         "to": 10,
//         "total": 218
//     }
// };
//       await bankDocRef.set(postData);

//       // Display a success message
//       print("Data posted to Firestore successfully");
//     } catch (e) {
//       // Handle errors
//       print("Error posting data to Firestore: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.deepOrange),
//       body: SafeArea(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: postData,
//               child: const Text('Post data to get_bank'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
