// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Interview {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? title;
  String? startTime;
  String? endTime;
  int? disableFlag;
  int? meetingRoomId;
  dynamic meetingRoom;
  
  Interview({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.startTime,
    this.endTime,
    this.disableFlag,
    this.meetingRoomId,
    this.meetingRoom,
  });
  

  Interview copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? title,
    String? startTime,
    String? endTime,
    int? disableFlag,
    int? meetingRoomId,
    dynamic meetingRoom,
  }) {
    return Interview(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      disableFlag: disableFlag ?? this.disableFlag,
      meetingRoomId: meetingRoomId ?? this.meetingRoomId,
      meetingRoom: meetingRoom ?? this.meetingRoom,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'title': title,
      'startTime': startTime,
      'endTime': endTime,
      'disableFlag': disableFlag,
      'meetingRoomId': meetingRoomId,
      'meetingRoom': meetingRoom,
    };
  }

  factory Interview.fromMap(Map<String, dynamic> map) {
    return Interview(
      id: map['id'] != null ? map['id'] as int : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      deletedAt: map['deletedAt'] != null ? map['deletedAt'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      startTime: map['startTime'] != null ? map['startTime'] as String : null,
      endTime: map['endTime'] != null ? map['endTime'] as String : null,
      disableFlag: map['disableFlag'] != null ? map['disableFlag'] as int : null,
      meetingRoomId: map['meetingRoomId'] != null ? map['meetingRoomId'] as int : null,
      meetingRoom: map['meetingRoom'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory Interview.fromJson(String source) => Interview.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Interview(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, title: $title, startTime: $startTime, endTime: $endTime, disableFlag: $disableFlag, meetingRoomId: $meetingRoomId, meetingRoom: $meetingRoom)';
  }

  @override
  bool operator ==(covariant Interview other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.deletedAt == deletedAt &&
      other.title == title &&
      other.startTime == startTime &&
      other.endTime == endTime &&
      other.disableFlag == disableFlag &&
      other.meetingRoomId == meetingRoomId &&
      other.meetingRoom == meetingRoom;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode ^
      title.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      disableFlag.hashCode ^
      meetingRoomId.hashCode ^
      meetingRoom.hashCode;
  }
}
