import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:private_messenger/strings.dart';


class ChatsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createChat({
    required String? user1email,
    required String? user2email,
    required String lastMessage,
    required DateTime lastMessageDate
  }) async {
    // Проверяем существование пользователей с заданными email
    final QuerySnapshot user1Query = await _firestore
        .collection('users')
        .where('email', isEqualTo: user1email)
        .limit(1)
        .get();

    final QuerySnapshot user2Query = await _firestore
        .collection('users')
        .where('email', isEqualTo: user2email)
        .limit(1)
        .get();

    if (user1Query.docs.isEmpty || user2Query.docs.isEmpty) {
      throw Exception(Strings.userNotFoundText);
    }

    if (user1email == user2email) {
      throw Exception(Strings.cantCreateChatWithYourselfText);
    }

    // Проверяем существование чата с данными пользователями
    final QuerySnapshot existingChats = await _firestore
        .collection('chats')
        .where('participants', arrayContainsAny: [user1email, user2email])
        .get();

    List<QueryDocumentSnapshot> validChats = existingChats.docs.where((doc) {
      List<dynamic> participants = doc['participants'];
      return participants.contains(user1email) && participants.contains(user2email);
    }).toList();

    if (validChats.isEmpty) {
      // Если чат не найден, создаем новый чат
      await _firestore.collection('chats').add({
        'participants': [user1email, user2email],
        'lastMessage': lastMessage,
        'lastMessageDate': lastMessageDate,
      });
    } else {
      // Если чат уже существует, вызываем исключение
      throw Exception(Strings.chatAlreadyExistsText);
    }
  }

  Future<void> updateChat({
    required String chatId,
    required String lastMessage,
    required DateTime lastMessageDate,
  }) async {
    await _firestore.collection('chats').doc(chatId).update({
      'lastMessage': lastMessage,
      'lastMessageDate': lastMessageDate,
    });
  }
}