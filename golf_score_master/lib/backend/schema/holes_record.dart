import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HolesRecord extends FirestoreRecord {
  HolesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hole_num" field.
  int? _holeNum;
  int get holeNum => _holeNum ?? 0;
  bool hasHoleNum() => _holeNum != null;

  // "par" field.
  int? _par;
  int get par => _par ?? 0;
  bool hasPar() => _par != null;

  // "yardage" field.
  int? _yardage;
  int get yardage => _yardage ?? 0;
  bool hasYardage() => _yardage != null;

  // "game_id" field.
  String? _gameId;
  String get gameId => _gameId ?? '';
  bool hasGameId() => _gameId != null;

  // "player_1_score" field.
  int? _player1Score;
  int get player1Score => _player1Score ?? 0;
  bool hasPlayer1Score() => _player1Score != null;

  // "player_2_score" field.
  int? _player2Score;
  int get player2Score => _player2Score ?? 0;
  bool hasPlayer2Score() => _player2Score != null;

  // "player_3_score" field.
  int? _player3Score;
  int get player3Score => _player3Score ?? 0;
  bool hasPlayer3Score() => _player3Score != null;

  // "player_4_score" field.
  int? _player4Score;
  int get player4Score => _player4Score ?? 0;
  bool hasPlayer4Score() => _player4Score != null;

  void _initializeFields() {
    _holeNum = castToType<int>(snapshotData['hole_num']);
    _par = castToType<int>(snapshotData['par']);
    _yardage = castToType<int>(snapshotData['yardage']);
    _gameId = snapshotData['game_id'] as String?;
    _player1Score = castToType<int>(snapshotData['player_1_score']);
    _player2Score = castToType<int>(snapshotData['player_2_score']);
    _player3Score = castToType<int>(snapshotData['player_3_score']);
    _player4Score = castToType<int>(snapshotData['player_4_score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('holes');

  static Stream<HolesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HolesRecord.fromSnapshot(s));

  static Future<HolesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HolesRecord.fromSnapshot(s));

  static HolesRecord fromSnapshot(DocumentSnapshot snapshot) => HolesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HolesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HolesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HolesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HolesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHolesRecordData({
  int? holeNum,
  int? par,
  int? yardage,
  String? gameId,
  int? player1Score,
  int? player2Score,
  int? player3Score,
  int? player4Score,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hole_num': holeNum,
      'par': par,
      'yardage': yardage,
      'game_id': gameId,
      'player_1_score': player1Score,
      'player_2_score': player2Score,
      'player_3_score': player3Score,
      'player_4_score': player4Score,
    }.withoutNulls,
  );

  return firestoreData;
}

class HolesRecordDocumentEquality implements Equality<HolesRecord> {
  const HolesRecordDocumentEquality();

  @override
  bool equals(HolesRecord? e1, HolesRecord? e2) {
    return e1?.holeNum == e2?.holeNum &&
        e1?.par == e2?.par &&
        e1?.yardage == e2?.yardage &&
        e1?.gameId == e2?.gameId &&
        e1?.player1Score == e2?.player1Score &&
        e1?.player2Score == e2?.player2Score &&
        e1?.player3Score == e2?.player3Score &&
        e1?.player4Score == e2?.player4Score;
  }

  @override
  int hash(HolesRecord? e) => const ListEquality().hash([
        e?.holeNum,
        e?.par,
        e?.yardage,
        e?.gameId,
        e?.player1Score,
        e?.player2Score,
        e?.player3Score,
        e?.player4Score
      ]);

  @override
  bool isValidKey(Object? o) => o is HolesRecord;
}
