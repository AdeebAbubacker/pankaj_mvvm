import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> postData(var data) async {
    try {
      // Reference to the collection and document
      CollectionReference collectionRef = _firestore.collection('student_3_parents');
      DocumentReference documentRef = collectionRef.doc('B27FLqLreTXvRr7ukwgk');

      // Add data to the document
      await documentRef.set(data);

      print('Data posted successfully');
    } catch (e) {
      print('Error posting data: $e');
      // Handle errors as per your application's requirements
    }
  }
}
