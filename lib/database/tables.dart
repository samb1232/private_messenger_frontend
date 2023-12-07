import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor/moor.dart';


@DataClassName('Chat')
class Chats extends Table {
  IntColumn get chatId => integer().customConstraint('PRIMARY KEY')();
  TextColumn get name => text()();
  TextColumn get lastMessage => text()();
  DateTimeColumn get lastMessageDate => dateTime().nullable()();
  IntColumn get unreadMessagesNumber => integer()();
}

@DataClassName('Message')
class Messages extends Table {
  IntColumn get id => integer()();
  IntColumn get chatId => integer().customConstraint('REFERENCES Chats(chatId)')();
  IntColumn get senderId => integer()();
  TextColumn get messageText => text()();
  DateTimeColumn get sentDate => dateTime().nullable()();
}

@DataClassName('ChatKey')
class ChatKeys extends Table {
  IntColumn get chatId => integer().customConstraint('REFERENCES Chats(chatId)')();
  IntColumn get publicKey => integer()();
}