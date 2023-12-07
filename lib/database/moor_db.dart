import 'package:moor_flutter/moor_flutter.dart';
import 'package:private_messenger/database/tables.dart';

part 'moor_db.g.dart';

@UseMoor(tables: [Chats, Messages, ChatKeys])
class DatabaseHelper extends _$DatabaseHelper {
  DatabaseHelper() : super(FlutterQueryExecutor.inDatabaseFolder(
    path: "db.sqlite",
    logStatements: true, // TODO: Убрать логгер
  ));

  @override
  int get schemaVersion => 1;


  Stream<List<Chat>> watchAllChats() => select(chats).watch();

  Stream<List<Message>> watchAllMessages() => select(messages).watch();

  Future updateChats(List<Chat> chatsList) async {
    for (Chat chat in chatsList) {
      if (!await update(chats).replace(chat)) {
        await into(chats).insert(chat);
      }
    }
  }

  Future updateMessages(List<Message> messagesList) async {
    for (Message message in messagesList) {
      if (!await update(messages).replace(message)) {
        await into(messages).insert(message);
      }
    }
  }


}