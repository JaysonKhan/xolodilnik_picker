import 'package:equatable/equatable.dart';
import 'package:xolodilnik_picker/utils/either.dart';
import 'package:xolodilnik_picker/utils/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
