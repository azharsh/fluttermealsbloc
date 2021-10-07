
import 'package:fluttermeal/repository/repository.dart';
import 'package:rxdart/rxdart.dart';


abstract class BaseBloc<T> {
  final repository = Repository();
  final fetcher = PublishSubject<T>();

  dispose() {
    fetcher.close();
  }
}
