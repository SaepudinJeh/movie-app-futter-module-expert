import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetWatchTVStatus {
  final TVRepository repository;

  GetWatchTVStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlist(id);
  }
}
