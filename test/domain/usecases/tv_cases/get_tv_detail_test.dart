import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvDetailSeries usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetTvDetailSeries(mockTVRepository);
  });

  final tId = 1;

  test('Should get detail TV from the repository', () async {
    // arrange
    when(mockTVRepository.getTVDetail(tId))
        .thenAnswer((_) async => Right(tTVDetail));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(tTVDetail));
  });
}
