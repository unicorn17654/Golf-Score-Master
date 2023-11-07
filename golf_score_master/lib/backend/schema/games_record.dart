import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GamesRecord extends FirestoreRecord {
  GamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "TIME" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "LOCATION" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "HOLES" field.
  int? _holes;
  int get holes => _holes ?? 0;
  bool hasHoles() => _holes != null;

  // "hole_records" field.
  List<DocumentReference>? _holeRecords;
  List<DocumentReference> get holeRecords => _holeRecords ?? const [];
  bool hasHoleRecords() => _holeRecords != null;

  // "total_par" field.
  int? _totalPar;
  int get totalPar => _totalPar ?? 0;
  bool hasTotalPar() => _totalPar != null;

  // "PLAYER_1_SCORE" field.
  int? _player1Score;
  int get player1Score => _player1Score ?? 0;
  bool hasPlayer1Score() => _player1Score != null;

  // "PLAYER_2_SCORE" field.
  int? _player2Score;
  int get player2Score => _player2Score ?? 0;
  bool hasPlayer2Score() => _player2Score != null;

  // "PLAYER_3_SCORE" field.
  int? _player3Score;
  int get player3Score => _player3Score ?? 0;
  bool hasPlayer3Score() => _player3Score != null;

  // "PLAYER_4_SCORE" field.
  int? _player4Score;
  int get player4Score => _player4Score ?? 0;
  bool hasPlayer4Score() => _player4Score != null;

  // "PLAYER1" field.
  String? _player1;
  String get player1 => _player1 ?? '';
  bool hasPlayer1() => _player1 != null;

  // "PLAYER2" field.
  String? _player2;
  String get player2 => _player2 ?? '';
  bool hasPlayer2() => _player2 != null;

  // "PLAYER3" field.
  String? _player3;
  String get player3 => _player3 ?? '';
  bool hasPlayer3() => _player3 != null;

  // "PLAYER4" field.
  String? _player4;
  String get player4 => _player4 ?? '';
  bool hasPlayer4() => _player4 != null;

  void _initializeFields() {
    _time = snapshotData['TIME'] as DateTime?;
    _location = snapshotData['LOCATION'] as String?;
    _holes = castToType<int>(snapshotData['HOLES']);
    _holeRecords = getDataList(snapshotData['hole_records']);
    _totalPar = castToType<int>(snapshotData['total_par']);
    _player1Score = castToType<int>(snapshotData['PLAYER_1_SCORE']);
    _player2Score = castToType<int>(snapshotData['PLAYER_2_SCORE']);
    _player3Score = castToType<int>(snapshotData['PLAYER_3_SCORE']);
    _player4Score = castToType<int>(snapshotData['PLAYER_4_SCORE']);
    _player1 = snapshotData['PLAYER1'] as String?;
    _player2 = snapshotData['PLAYER2'] as String?;
    _player3 = snapshotData['PLAYER3'] as String?;
    _player4 = snapshotData['PLAYER4'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('games');

  static Stream<GamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GamesRecord.fromSnapshot(s));

  static Future<GamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GamesRecord.fromSnapshot(s));

  static GamesRecord fromSnapshot(DocumentSnapshot snapshot) => GamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGamesRecordData({
  DateTime? time,
  String? location,
  int? holes,
  int? totalPar,
  int? player1Score,
  int? player2Score,
  int? player3Score,
  int? player4Score,
  String? player1,
  String? player2,
  String? player3,
  String? player4,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TIME': time,
      'LOCATION': location,
      'HOLES': holes,
      'total_par': totalPar,
      'PLAYER_1_SCORE': player1Score,
      'PLAYER_2_SCORE': player2Score,
      'PLAYER_3_SCORE': player3Score,
      'PLAYER_4_SCORE': player4Score,
      'PLAYER1': player1,
      'PLAYER2': player2,
      'PLAYER3': player3,
      'PLAYER4': player4,
    }.withoutNulls,
  );

  return firestoreData;
}

class GamesRecordDocumentEquality implements Equality<GamesRecord> {
  const GamesRecordDocumentEquality();

  @override
  bool equals(GamesRecord? e1, GamesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.time == e2?.time &&
        e1?.location == e2?.location &&
        e1?.holes == e2?.holes &&
        listEquality.equals(e1?.holeRecords, e2?.holeRecords) &&
        e1?.totalPar == e2?.totalPar &&
        e1?.player1Score == e2?.player1Score &&
        e1?.player2Score == e2?.player2Score &&
        e1?.player3Score == e2?.player3Score &&
        e1?.player4Score == e2?.player4Score &&
        e1?.player1 == e2?.player1 &&
        e1?.player2 == e2?.player2 &&
        e1?.player3 == e2?.player3 &&
        e1?.player4 == e2?.player4;
  }

  @override
  int hash(GamesRecord? e) => const ListEquality().hash([
        e?.time,
        e?.location,
        e?.holes,
        e?.holeRecords,
        e?.totalPar,
        e?.player1Score,
        e?.player2Score,
        e?.player3Score,
        e?.player4Score,
        e?.player1,
        e?.player2,
        e?.player3,
        e?.player4
      ]);

  @override
  bool isValidKey(Object? o) => o is GamesRecord;
}
