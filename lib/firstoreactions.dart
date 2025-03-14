import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreActions {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> insert(String name, int score, String genre) async {
    try {
      // Get the latest numeric ID by counting existing documents
      final QuerySnapshot snapshot = await _firestore.collection('games').get();
      int newID = snapshot.docs.length + 1; // Increment ID based on the count

      await _firestore.collection('games').doc(newID.toString()).set({
        'name': name,
        'score': score,
        'genre': genre,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print("Data added successfully with ID: $newID");
    } catch (e) {
      print("Failed to add data: $e");
      rethrow;
    }
  }
}
