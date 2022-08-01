import 'package:budget_tracker/src/data/firebase/firebase_datasource.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FakeFirebaseFirestore firestore;
  late FirebaseDatasource datasource;
  setUp(() {
    firestore = FakeFirebaseFirestore();
    datasource = FirebaseDatasource(firestore: firestore);
  });

  group('firebase datasource ...', () {
    group('transaction', () {
      group('add', () {
        test('should update account total balance', () async {
          //Arrange

          //Act

          //Assert
        });
      });
    });
  });
}
