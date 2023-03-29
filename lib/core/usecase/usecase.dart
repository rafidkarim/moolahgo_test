import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moolah_go/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParam extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
