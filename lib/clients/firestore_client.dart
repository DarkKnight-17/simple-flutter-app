import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreClient {
  static final _db = FirebaseFirestore.instance;

  final StreamController _streamController =
      StreamController<List<Map<String, dynamic>>>.broadcast();

  Future<void> add(String collection, Map<String, dynamic> newData) async {
    try {
      await _db.collection(collection).add(newData);
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future<List<Map<String, dynamic>>?> getByCollection(String collection) async {
    try {
      final snapshot = await _db.collection(collection).get();
      final collectionData = snapshot.docs.map((doc) => doc.data()).toList();
      return collectionData;
    } on FirebaseException catch (e) {
      print(e.message);
      return null;
    }
  }

  static const dataLimit = 15;

  bool hasMoreData = true;

  final _allPagedResults = <List<Map<String, dynamic>>>[];

  DocumentSnapshot? _lastDocument;

  Stream listenToDataRealtime(String collection) {
    requestMoreData(collection);

    return _streamController.stream;
  }

  void requestMoreData(String collection) {
    print('More data has been requested');
    var pageDataQuery =
        _db.collection(collection).orderBy('timestamp').limit(dataLimit);

    if (_lastDocument != null) {
      pageDataQuery = pageDataQuery.startAfterDocument(_lastDocument!);
    }

    if (!hasMoreData) return;

    pageDataQuery.snapshots().listen((data) async {
      if (data.docs.isNotEmpty) {
        var dataRecords = data.docs.map((record) {
          var rawData = record.data();
          rawData['id'] = record.id.toString();
          return rawData;
        }).toList();
        _allPagedResults.add(dataRecords);
        print('data records length:  ${dataRecords.length}');
        // Concatenate the full list to be shown
        final allData = _allPagedResults.fold<List<Map<String, dynamic>>>(
            [], (initialValue, pageItems) => initialValue..addAll(pageItems));

        _streamController.sink.add(allData);

        _lastDocument = data.docs.last;

        var futureCheckQuery = pageDataQuery.startAfterDocument(_lastDocument!);
        final futureData = await futureCheckQuery.get();
        bool futureDataExists = futureData.docs.isNotEmpty;

        print(futureDataExists);
        hasMoreData = futureDataExists;
      }
    });
  }

  Future<Map<String, dynamic>?> getByCollectionAndById(
      String collection, String docId) async {
    try {
      final doc = await _db.collection(collection).doc(docId).get();
      return doc.data() ?? {};
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> update(
      String collection, String docID, Map<String, dynamic> newData) async {
    try {
      return _db.collection(collection).doc(docID).update(newData);
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String collection, String docID) async {
    try {
      return _db.collection(collection).doc(docID).delete();
    } catch (e) {
      print(e);
    }
  }
}
