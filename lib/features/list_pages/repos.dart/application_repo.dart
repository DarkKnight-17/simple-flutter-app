import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_flutter_app/clients/firestore_client.dart';
import 'package:my_flutter_app/models/application.dart';

class ApplicationRepo {
  final _firestoreClient = FirestoreClient();

  Future<void> addApplication(Map<String, dynamic> data) async {
    var newData = <String, dynamic>{};
    newData.addAll(data);
    newData['timestamp'] = Timestamp.now();
    await _firestoreClient.add('applications', newData);
  }

  StreamTransformer streamTransformer = StreamTransformer<
      List<Map<String, dynamic>>, List<Application>>.fromHandlers(
    handleData: (data, sink) {
      List<Application> transformedData =
          data.map(Application.fromJson).toList();
      sink.add(transformedData);
    },
  );

  bool get hasMoreData => _firestoreClient.hasMoreData;

  Stream listenToDataRealtime() {
    return _firestoreClient
        .listenToDataRealtime('applications')
        .transform(streamTransformer);
  }

  Future<void> deleteApplication(String docID) async {
    return _firestoreClient.delete('applications', docID);
  }

  Future<void> updateApplication(
      String docID, Map<String, dynamic> newData) async {
    return _firestoreClient.update('applications', docID, newData);
  }

  Future<List<Map<String, dynamic>>?> getAll() async {
    final data = await _firestoreClient.getByCollection('applications');
    return data;
  }

  Future<Map<String, dynamic>?> getById(String docID) async {
    final data =
        await _firestoreClient.getByCollectionAndById('applications', docID);
    return data;
  }
}
