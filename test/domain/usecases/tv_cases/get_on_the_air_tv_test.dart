import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_on_the_airing_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetOnTheAirTVSeries usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetOnTheAirTVSeries(mockTVRepository);
  });

  final tListTv = <TV>[];

  test('Should get list on the air TV from the repository', () async {
    // arrange
    when(mockTVRepository.getOnTheAirTV())
        .thenAnswer((_) async => Right(tListTv));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tListTv));
  });
}
