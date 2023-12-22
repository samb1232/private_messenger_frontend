import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> markChatAsRead(String chatId) async {
    await _firestore
        .collection('notifications')
        .doc(_auth.currentUser!.email)
        .set({chatId: false}, SetOptions(merge: true));
  }

  Future<void> markChatAsUnread(String userEmail, String chatId) async {
    await _firestore
        .collection('notifications')
        .doc(userEmail)
        .set({chatId: true}, SetOptions(merge: true));
  }


  Stream<DocumentSnapshot> getNotificationsStream(String userEmail) {
    return _firestore.collection('notifications').doc(userEmail).snapshots();
  }

}