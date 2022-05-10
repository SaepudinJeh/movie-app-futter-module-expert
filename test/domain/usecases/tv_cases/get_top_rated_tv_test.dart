import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv/get_top_rated_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopTVSeries usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetTopTVSeries(mockTVRepository);
  });

  test('Should get list TV top rated from the repository', () async {
    // arrange
    when(mockTVRepository.getTopRatedTV())
        .thenAnswer((_) async => Right(tTvList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvList));
  });
}
