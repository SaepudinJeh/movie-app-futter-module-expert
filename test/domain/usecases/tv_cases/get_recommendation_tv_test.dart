import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv/get_recommendation_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetRecommendationTVSeries usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetRecommendationTVSeries(mockTVRepository);
  });

  final tId = 1;

  test('Should get list TV recommendation from the repository', () async {
    // arrange
    when(mockTVRepository.getRecommendationTV(tId))
        .thenAnswer((_) async => Right(tTvList));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(tTvList));
  });
}
