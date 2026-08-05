import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_c16_mon/data/models/sources_response.dart';

class FirebaseService {
  FirebaseFirestore dp = FirebaseFirestore.instance;

  CollectionReference<Sources> getSourceCollectionReference() {
    return dp
        .collection("sources")
        .withConverter(
          fromFirestore: (snapshot, _) => Sources.fromJson(snapshot.data()!),
          toFirestore: (sources, _) => sources.toJson(),
        );
  }

  Future<void> addSourcesList(List<Sources> sources, String categoryId) async {
    var collection = await getSourceCollectionReference().get();
    for (var doc in collection.docs) {
      if (doc.data().category == categoryId) {
        return;
      }
    }
    for (var source in sources) {
      await getSourceCollectionReference().doc(source.id).set(source);
    }
  }

  Future<void> clearCache() async {
    var collection = await getSourceCollectionReference().get();
    for (var doc in collection.docs) {
      await doc.reference.delete();
    }
  }

  Future<List<Sources>> getSources(String categoryId) async {
    var collection = await getSourceCollectionReference().get();
    List<Sources> sources = [];
    for (var doc in collection.docs) {
      sources.add(doc.data());
    }
    return sources;
  }
}
