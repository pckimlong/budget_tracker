import 'package:budget_tracker/src/core/app_failure.dart';
import 'package:budget_tracker/src/data/firebase/firebase_datasource.dart';
import 'package:budget_tracker/src/data/firebase/firebase_extensions.dart';
import 'package:budget_tracker/src/data/model/account.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
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
        test('should throw Failure.invalid error if amount or category is invalid',
            () async {
          // if amount is invalid
          var amountError = false;
          try {
            await datasource.createTran(
              Tran(categoryId: 'categoryId', date: DateTime.now(), amount: 0),
            );
            amountError = false;
          } catch (e) {
            amountError = true;
            expect(e, isA<Failure>());
          }
          expect(amountError, isTrue);
          // if amount is invalid

          var categoryError = false;
          try {
            await datasource.createTran(
              Tran(categoryId: '', date: DateTime.now(), amount: 10),
            );
            categoryError = false;
          } catch (e) {
            categoryError = true;
            expect(e, isA<Failure>());
          }
          expect(categoryError, isTrue);
        });
        test('should increment account total balance if category is a income type',
            () async {
          //Arrange
          await firestore.categoryCollection.doc('1').set(
                Category(
                  id: '1',
                  type: CategoryType.income,
                  name: 'income category',
                ),
              );

          //Act
          await datasource.createTran(
            Tran(
              categoryId: '1',
              date: DateTime.now(),
              amount: 100,
            ),
          );

          final account = await firestore.userDoc.get();

          //Assert
          expect(account.data()!.totalBalance, equals(100));
        });
        test('should decrement account total balance if category is a expense type',
            () async {
          //Arrange
          await firestore.categoryCollection.doc('1').set(
                Category(
                  id: '1',
                  type: CategoryType.expense,
                  name: 'expense category',
                ),
              );
          await firestore.userDoc.set(Account(totalBalance: 100));

          //Act
          await datasource.createTran(
            Tran(
              categoryId: '1',
              date: DateTime.now(),
              amount: 100,
            ),
          );

          final account = await firestore.userDoc.get();

          //Assert
          expect(account.data()!.totalBalance, equals(0));
        });
        test('should create tran with correct data eg. id', () async {
          //Arrange
          await firestore.categoryCollection.doc('1').set(
                Category(
                  id: '1',
                  type: CategoryType.expense,
                  name: 'expense category',
                ),
              );

          //Act
          final id = await datasource.createTran(
            Tran(
              categoryId: '1',
              date: DateTime.now(),
              amount: 100,
            ),
          );

          final tran = await firestore.tranCollection.doc(id).get();

          //Assert
          expect(tran.data()!.id, equals(id));
        });
      });

      group('update', () {
        test('should throw Failure error if id, amount or category is invalid',
            () async {
          // if id is null
          expect(() async {
            await datasource.updateTran(
              Tran(
                id: null,
                categoryId: 'categoryId',
                date: DateTime.now(),
                amount: 100,
              ),
            );
          }, throwsAssertionError);

          // if amount is invalid
          var amountError = false;
          try {
            await datasource.updateTran(
              Tran(
                id: '11',
                categoryId: 'categoryId',
                date: DateTime.now(),
                amount: 0,
              ),
            );
            amountError = false;
          } catch (e) {
            amountError = true;
            expect(e, isA<Failure>());
          }
          expect(amountError, isTrue);
          // if amount is invalid

          var categoryError = false;
          try {
            await datasource.updateTran(
              Tran(
                id: 'fjsd',
                categoryId: '',
                date: DateTime.now(),
                amount: 10,
              ),
            );
            categoryError = false;
          } catch (e) {
            categoryError = true;
            expect(e, isA<Failure>());
          }
          expect(categoryError, isTrue);
        });

        test('should decrement account total balance', () async {
          //Arrange
          await firestore.categoryCollection.doc('1').set(
                Category(
                  id: '1',
                  type: CategoryType.expense,
                  name: 'expense category',
                ),
              );
          await firestore.userDoc.set(Account(totalBalance: 130));
          await firestore.tranCollection.doc('1').set(
                Tran(
                  id: '1',
                  categoryId: '1',
                  date: DateTime.now(),
                  amount: 100,
                ),
              );

          //Act
          await datasource.updateTran(
            Tran(
              id: '1',
              categoryId: '1',
              date: DateTime.now(),
              amount: 20,
            ),
          );

          final account = await firestore.userDoc.get();

          //Assert
          expect(account.data()!.totalBalance, equals(50));
        });
        test('should increment account total balance', () async {
          //Arrange
          await firestore.categoryCollection.doc('1').set(
                Category(
                  id: '1',
                  type: CategoryType.income,
                  name: 'expense category',
                ),
              );
          await firestore.userDoc.set(Account(totalBalance: 130));
          await firestore.tranCollection.doc('1').set(
                Tran(
                  id: '1',
                  categoryId: '1',
                  date: DateTime.now(),
                  amount: 30,
                ),
              );

          //Act
          await datasource.updateTran(
            Tran(
              id: '1',
              categoryId: '1',
              date: DateTime.now(),
              amount: 100,
            ),
          );

          final account = await firestore.userDoc.get();

          //Assert
          expect(account.data()!.totalBalance, equals(200));
        });
        test('should throw failure if category type changed', () async {
          //Arrange
          await firestore.categoryCollection.doc('1').set(
                Category(
                  id: '1',
                  type: CategoryType.income,
                  name: 'expense category',
                ),
              );
          await firestore.categoryCollection.doc('2').set(
                Category(
                  id: '2',
                  type: CategoryType.expense,
                  name: 'expense category',
                ),
              );
          await firestore.userDoc.set(Account(totalBalance: 130));
          await firestore.tranCollection.doc('1').set(
                Tran(
                  id: '1',
                  categoryId: '1',
                  date: DateTime.now(),
                  amount: 30,
                ),
              );

          //Act
          var hasError = false;
          try {
            await datasource.updateTran(
              Tran(
                id: '1',
                categoryId: '2',
                date: DateTime.now(),
                amount: 100,
              ),
            );
            hasError = false;
          } catch (e) {
            hasError = true;
            expect(e, isA<Failure>());
          }

          expect(hasError, isTrue);
        });
      });

      group('delete', () {
        test('should increment account balance if tran is expense', () async {
          //Arrange
          await firestore.categoryCollection.doc('1').set(
                Category(
                  id: '1',
                  type: CategoryType.expense,
                  name: 'expense category',
                ),
              );
          await firestore.userDoc.set(Account(totalBalance: 130));
          await firestore.tranCollection.doc('1').set(
                Tran(
                  id: '1',
                  categoryId: '1',
                  date: DateTime.now(),
                  amount: 70,
                ),
              );

          //Act
          await datasource.deleteTran("1");

          final account = await firestore.userDoc.get();

          //Assert
          expect(account.data()!.totalBalance, equals(200));
        });
        test('should decrement account balance if tran is income', () async {
          //Arrange
          await firestore.categoryCollection.doc('1').set(
                Category(
                  id: '1',
                  type: CategoryType.income,
                  name: 'income category',
                ),
              );
          await firestore.userDoc.set(Account(totalBalance: 200));
          await firestore.tranCollection.doc('1').set(
                Tran(
                  id: '1',
                  categoryId: '1',
                  date: DateTime.now(),
                  amount: 70,
                ),
              );

          //Act
          await datasource.deleteTran("1");

          final account = await firestore.userDoc.get();

          //Assert
          expect(account.data()!.totalBalance, equals(130));
        });
        test('should delete tran', () async {
          //Arrange
          await firestore.categoryCollection.doc('1').set(
                Category(
                  id: '1',
                  type: CategoryType.income,
                  name: 'income category',
                ),
              );
          await firestore.userDoc.set(Account(totalBalance: 200));
          await firestore.tranCollection.doc('1').set(
                Tran(
                  id: '1',
                  categoryId: '1',
                  date: DateTime.now(),
                  amount: 70,
                ),
              );

          //Act
          await datasource.deleteTran("1");

          final tran = await firestore.tranCollection.doc('1').get();

          //Assert
          expect(tran.exists, isFalse);
        });
      });
    });
  });
}
