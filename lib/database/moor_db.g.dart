// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Chat extends DataClass implements Insertable<Chat> {
  final int chatId;
  final String name;
  final String lastMessage;
  final DateTime? lastMessageDate;
  final int unreadMessagesNumber;
  Chat(
      {required this.chatId,
      required this.name,
      required this.lastMessage,
      this.lastMessageDate,
      required this.unreadMessagesNumber});
  factory Chat.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Chat(
      chatId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      lastMessage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_message'])!,
      lastMessageDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_message_date']),
      unreadMessagesNumber: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}unread_messages_number'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['chat_id'] = Variable<int>(chatId);
    map['name'] = Variable<String>(name);
    map['last_message'] = Variable<String>(lastMessage);
    if (!nullToAbsent || lastMessageDate != null) {
      map['last_message_date'] = Variable<DateTime?>(lastMessageDate);
    }
    map['unread_messages_number'] = Variable<int>(unreadMessagesNumber);
    return map;
  }

  ChatsCompanion toCompanion(bool nullToAbsent) {
    return ChatsCompanion(
      chatId: Value(chatId),
      name: Value(name),
      lastMessage: Value(lastMessage),
      lastMessageDate: lastMessageDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastMessageDate),
      unreadMessagesNumber: Value(unreadMessagesNumber),
    );
  }

  factory Chat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Chat(
      chatId: serializer.fromJson<int>(json['chatId']),
      name: serializer.fromJson<String>(json['name']),
      lastMessage: serializer.fromJson<String>(json['lastMessage']),
      lastMessageDate: serializer.fromJson<DateTime?>(json['lastMessageDate']),
      unreadMessagesNumber:
          serializer.fromJson<int>(json['unreadMessagesNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chatId': serializer.toJson<int>(chatId),
      'name': serializer.toJson<String>(name),
      'lastMessage': serializer.toJson<String>(lastMessage),
      'lastMessageDate': serializer.toJson<DateTime?>(lastMessageDate),
      'unreadMessagesNumber': serializer.toJson<int>(unreadMessagesNumber),
    };
  }

  Chat copyWith(
          {int? chatId,
          String? name,
          String? lastMessage,
          DateTime? lastMessageDate,
          int? unreadMessagesNumber}) =>
      Chat(
        chatId: chatId ?? this.chatId,
        name: name ?? this.name,
        lastMessage: lastMessage ?? this.lastMessage,
        lastMessageDate: lastMessageDate ?? this.lastMessageDate,
        unreadMessagesNumber: unreadMessagesNumber ?? this.unreadMessagesNumber,
      );
  @override
  String toString() {
    return (StringBuffer('Chat(')
          ..write('chatId: $chatId, ')
          ..write('name: $name, ')
          ..write('lastMessage: $lastMessage, ')
          ..write('lastMessageDate: $lastMessageDate, ')
          ..write('unreadMessagesNumber: $unreadMessagesNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      chatId, name, lastMessage, lastMessageDate, unreadMessagesNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chat &&
          other.chatId == this.chatId &&
          other.name == this.name &&
          other.lastMessage == this.lastMessage &&
          other.lastMessageDate == this.lastMessageDate &&
          other.unreadMessagesNumber == this.unreadMessagesNumber);
}

class ChatsCompanion extends UpdateCompanion<Chat> {
  final Value<int> chatId;
  final Value<String> name;
  final Value<String> lastMessage;
  final Value<DateTime?> lastMessageDate;
  final Value<int> unreadMessagesNumber;
  const ChatsCompanion({
    this.chatId = const Value.absent(),
    this.name = const Value.absent(),
    this.lastMessage = const Value.absent(),
    this.lastMessageDate = const Value.absent(),
    this.unreadMessagesNumber = const Value.absent(),
  });
  ChatsCompanion.insert({
    required int chatId,
    required String name,
    required String lastMessage,
    this.lastMessageDate = const Value.absent(),
    required int unreadMessagesNumber,
  })  : chatId = Value(chatId),
        name = Value(name),
        lastMessage = Value(lastMessage),
        unreadMessagesNumber = Value(unreadMessagesNumber);
  static Insertable<Chat> custom({
    Expression<int>? chatId,
    Expression<String>? name,
    Expression<String>? lastMessage,
    Expression<DateTime?>? lastMessageDate,
    Expression<int>? unreadMessagesNumber,
  }) {
    return RawValuesInsertable({
      if (chatId != null) 'chat_id': chatId,
      if (name != null) 'name': name,
      if (lastMessage != null) 'last_message': lastMessage,
      if (lastMessageDate != null) 'last_message_date': lastMessageDate,
      if (unreadMessagesNumber != null)
        'unread_messages_number': unreadMessagesNumber,
    });
  }

  ChatsCompanion copyWith(
      {Value<int>? chatId,
      Value<String>? name,
      Value<String>? lastMessage,
      Value<DateTime?>? lastMessageDate,
      Value<int>? unreadMessagesNumber}) {
    return ChatsCompanion(
      chatId: chatId ?? this.chatId,
      name: name ?? this.name,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageDate: lastMessageDate ?? this.lastMessageDate,
      unreadMessagesNumber: unreadMessagesNumber ?? this.unreadMessagesNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (chatId.present) {
      map['chat_id'] = Variable<int>(chatId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastMessage.present) {
      map['last_message'] = Variable<String>(lastMessage.value);
    }
    if (lastMessageDate.present) {
      map['last_message_date'] = Variable<DateTime?>(lastMessageDate.value);
    }
    if (unreadMessagesNumber.present) {
      map['unread_messages_number'] = Variable<int>(unreadMessagesNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatsCompanion(')
          ..write('chatId: $chatId, ')
          ..write('name: $name, ')
          ..write('lastMessage: $lastMessage, ')
          ..write('lastMessageDate: $lastMessageDate, ')
          ..write('unreadMessagesNumber: $unreadMessagesNumber')
          ..write(')'))
        .toString();
  }
}

class $ChatsTable extends Chats with TableInfo<$ChatsTable, Chat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  @override
  late final GeneratedColumn<int?> chatId = GeneratedColumn<int?>(
      'chat_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _lastMessageMeta =
      const VerificationMeta('lastMessage');
  @override
  late final GeneratedColumn<String?> lastMessage = GeneratedColumn<String?>(
      'last_message', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _lastMessageDateMeta =
      const VerificationMeta('lastMessageDate');
  @override
  late final GeneratedColumn<DateTime?> lastMessageDate =
      GeneratedColumn<DateTime?>('last_message_date', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _unreadMessagesNumberMeta =
      const VerificationMeta('unreadMessagesNumber');
  @override
  late final GeneratedColumn<int?> unreadMessagesNumber = GeneratedColumn<int?>(
      'unread_messages_number', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [chatId, name, lastMessage, lastMessageDate, unreadMessagesNumber];
  @override
  String get aliasedName => _alias ?? 'chats';
  @override
  String get actualTableName => 'chats';
  @override
  VerificationContext validateIntegrity(Insertable<Chat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('chat_id')) {
      context.handle(_chatIdMeta,
          chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta));
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_message')) {
      context.handle(
          _lastMessageMeta,
          lastMessage.isAcceptableOrUnknown(
              data['last_message']!, _lastMessageMeta));
    } else if (isInserting) {
      context.missing(_lastMessageMeta);
    }
    if (data.containsKey('last_message_date')) {
      context.handle(
          _lastMessageDateMeta,
          lastMessageDate.isAcceptableOrUnknown(
              data['last_message_date']!, _lastMessageDateMeta));
    }
    if (data.containsKey('unread_messages_number')) {
      context.handle(
          _unreadMessagesNumberMeta,
          unreadMessagesNumber.isAcceptableOrUnknown(
              data['unread_messages_number']!, _unreadMessagesNumberMeta));
    } else if (isInserting) {
      context.missing(_unreadMessagesNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Chat map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Chat.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChatsTable createAlias(String alias) {
    return $ChatsTable(attachedDatabase, alias);
  }
}

class Message extends DataClass implements Insertable<Message> {
  final int id;
  final int chatId;
  final int senderId;
  final String messageText;
  final DateTime? sentDate;
  Message(
      {required this.id,
      required this.chatId,
      required this.senderId,
      required this.messageText,
      this.sentDate});
  factory Message.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Message(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      chatId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_id'])!,
      senderId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sender_id'])!,
      messageText: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message_text'])!,
      sentDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sent_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chat_id'] = Variable<int>(chatId);
    map['sender_id'] = Variable<int>(senderId);
    map['message_text'] = Variable<String>(messageText);
    if (!nullToAbsent || sentDate != null) {
      map['sent_date'] = Variable<DateTime?>(sentDate);
    }
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      chatId: Value(chatId),
      senderId: Value(senderId),
      messageText: Value(messageText),
      sentDate: sentDate == null && nullToAbsent
          ? const Value.absent()
          : Value(sentDate),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<int>(json['id']),
      chatId: serializer.fromJson<int>(json['chatId']),
      senderId: serializer.fromJson<int>(json['senderId']),
      messageText: serializer.fromJson<String>(json['messageText']),
      sentDate: serializer.fromJson<DateTime?>(json['sentDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chatId': serializer.toJson<int>(chatId),
      'senderId': serializer.toJson<int>(senderId),
      'messageText': serializer.toJson<String>(messageText),
      'sentDate': serializer.toJson<DateTime?>(sentDate),
    };
  }

  Message copyWith(
          {int? id,
          int? chatId,
          int? senderId,
          String? messageText,
          DateTime? sentDate}) =>
      Message(
        id: id ?? this.id,
        chatId: chatId ?? this.chatId,
        senderId: senderId ?? this.senderId,
        messageText: messageText ?? this.messageText,
        sentDate: sentDate ?? this.sentDate,
      );
  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('senderId: $senderId, ')
          ..write('messageText: $messageText, ')
          ..write('sentDate: $sentDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chatId, senderId, messageText, sentDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          other.id == this.id &&
          other.chatId == this.chatId &&
          other.senderId == this.senderId &&
          other.messageText == this.messageText &&
          other.sentDate == this.sentDate);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<int> id;
  final Value<int> chatId;
  final Value<int> senderId;
  final Value<String> messageText;
  final Value<DateTime?> sentDate;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.chatId = const Value.absent(),
    this.senderId = const Value.absent(),
    this.messageText = const Value.absent(),
    this.sentDate = const Value.absent(),
  });
  MessagesCompanion.insert({
    required int id,
    required int chatId,
    required int senderId,
    required String messageText,
    this.sentDate = const Value.absent(),
  })  : id = Value(id),
        chatId = Value(chatId),
        senderId = Value(senderId),
        messageText = Value(messageText);
  static Insertable<Message> custom({
    Expression<int>? id,
    Expression<int>? chatId,
    Expression<int>? senderId,
    Expression<String>? messageText,
    Expression<DateTime?>? sentDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatId != null) 'chat_id': chatId,
      if (senderId != null) 'sender_id': senderId,
      if (messageText != null) 'message_text': messageText,
      if (sentDate != null) 'sent_date': sentDate,
    });
  }

  MessagesCompanion copyWith(
      {Value<int>? id,
      Value<int>? chatId,
      Value<int>? senderId,
      Value<String>? messageText,
      Value<DateTime?>? sentDate}) {
    return MessagesCompanion(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      senderId: senderId ?? this.senderId,
      messageText: messageText ?? this.messageText,
      sentDate: sentDate ?? this.sentDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chatId.present) {
      map['chat_id'] = Variable<int>(chatId.value);
    }
    if (senderId.present) {
      map['sender_id'] = Variable<int>(senderId.value);
    }
    if (messageText.present) {
      map['message_text'] = Variable<String>(messageText.value);
    }
    if (sentDate.present) {
      map['sent_date'] = Variable<DateTime?>(sentDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('senderId: $senderId, ')
          ..write('messageText: $messageText, ')
          ..write('sentDate: $sentDate')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  @override
  late final GeneratedColumn<int?> chatId = GeneratedColumn<int?>(
      'chat_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES Chats(chatId)');
  final VerificationMeta _senderIdMeta = const VerificationMeta('senderId');
  @override
  late final GeneratedColumn<int?> senderId = GeneratedColumn<int?>(
      'sender_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _messageTextMeta =
      const VerificationMeta('messageText');
  @override
  late final GeneratedColumn<String?> messageText = GeneratedColumn<String?>(
      'message_text', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _sentDateMeta = const VerificationMeta('sentDate');
  @override
  late final GeneratedColumn<DateTime?> sentDate = GeneratedColumn<DateTime?>(
      'sent_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, chatId, senderId, messageText, sentDate];
  @override
  String get aliasedName => _alias ?? 'messages';
  @override
  String get actualTableName => 'messages';
  @override
  VerificationContext validateIntegrity(Insertable<Message> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('chat_id')) {
      context.handle(_chatIdMeta,
          chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta));
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('sender_id')) {
      context.handle(_senderIdMeta,
          senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta));
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('message_text')) {
      context.handle(
          _messageTextMeta,
          messageText.isAcceptableOrUnknown(
              data['message_text']!, _messageTextMeta));
    } else if (isInserting) {
      context.missing(_messageTextMeta);
    }
    if (data.containsKey('sent_date')) {
      context.handle(_sentDateMeta,
          sentDate.isAcceptableOrUnknown(data['sent_date']!, _sentDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Message map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Message.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class ChatKey extends DataClass implements Insertable<ChatKey> {
  final int chatId;
  final int publicKey;
  ChatKey({required this.chatId, required this.publicKey});
  factory ChatKey.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ChatKey(
      chatId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_id'])!,
      publicKey: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}public_key'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['chat_id'] = Variable<int>(chatId);
    map['public_key'] = Variable<int>(publicKey);
    return map;
  }

  ChatKeysCompanion toCompanion(bool nullToAbsent) {
    return ChatKeysCompanion(
      chatId: Value(chatId),
      publicKey: Value(publicKey),
    );
  }

  factory ChatKey.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ChatKey(
      chatId: serializer.fromJson<int>(json['chatId']),
      publicKey: serializer.fromJson<int>(json['publicKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chatId': serializer.toJson<int>(chatId),
      'publicKey': serializer.toJson<int>(publicKey),
    };
  }

  ChatKey copyWith({int? chatId, int? publicKey}) => ChatKey(
        chatId: chatId ?? this.chatId,
        publicKey: publicKey ?? this.publicKey,
      );
  @override
  String toString() {
    return (StringBuffer('ChatKey(')
          ..write('chatId: $chatId, ')
          ..write('publicKey: $publicKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(chatId, publicKey);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatKey &&
          other.chatId == this.chatId &&
          other.publicKey == this.publicKey);
}

class ChatKeysCompanion extends UpdateCompanion<ChatKey> {
  final Value<int> chatId;
  final Value<int> publicKey;
  const ChatKeysCompanion({
    this.chatId = const Value.absent(),
    this.publicKey = const Value.absent(),
  });
  ChatKeysCompanion.insert({
    required int chatId,
    required int publicKey,
  })  : chatId = Value(chatId),
        publicKey = Value(publicKey);
  static Insertable<ChatKey> custom({
    Expression<int>? chatId,
    Expression<int>? publicKey,
  }) {
    return RawValuesInsertable({
      if (chatId != null) 'chat_id': chatId,
      if (publicKey != null) 'public_key': publicKey,
    });
  }

  ChatKeysCompanion copyWith({Value<int>? chatId, Value<int>? publicKey}) {
    return ChatKeysCompanion(
      chatId: chatId ?? this.chatId,
      publicKey: publicKey ?? this.publicKey,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (chatId.present) {
      map['chat_id'] = Variable<int>(chatId.value);
    }
    if (publicKey.present) {
      map['public_key'] = Variable<int>(publicKey.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatKeysCompanion(')
          ..write('chatId: $chatId, ')
          ..write('publicKey: $publicKey')
          ..write(')'))
        .toString();
  }
}

class $ChatKeysTable extends ChatKeys with TableInfo<$ChatKeysTable, ChatKey> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatKeysTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  @override
  late final GeneratedColumn<int?> chatId = GeneratedColumn<int?>(
      'chat_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES Chats(chatId)');
  final VerificationMeta _publicKeyMeta = const VerificationMeta('publicKey');
  @override
  late final GeneratedColumn<int?> publicKey = GeneratedColumn<int?>(
      'public_key', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [chatId, publicKey];
  @override
  String get aliasedName => _alias ?? 'chat_keys';
  @override
  String get actualTableName => 'chat_keys';
  @override
  VerificationContext validateIntegrity(Insertable<ChatKey> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('chat_id')) {
      context.handle(_chatIdMeta,
          chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta));
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('public_key')) {
      context.handle(_publicKeyMeta,
          publicKey.isAcceptableOrUnknown(data['public_key']!, _publicKeyMeta));
    } else if (isInserting) {
      context.missing(_publicKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ChatKey map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ChatKey.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChatKeysTable createAlias(String alias) {
    return $ChatKeysTable(attachedDatabase, alias);
  }
}

abstract class _$DatabaseHelper extends GeneratedDatabase {
  _$DatabaseHelper(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ChatsTable chats = $ChatsTable(this);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $ChatKeysTable chatKeys = $ChatKeysTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [chats, messages, chatKeys];
}
