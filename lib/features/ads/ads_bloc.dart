import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moolah_go/core/shared/domain/entity/advertisement.dart';
import 'package:moolah_go/core/shared/domain/entity/user.dart';
import 'package:moolah_go/core/shared/domain/usecase/get_ads_usecase.dart';
import 'package:moolah_go/core/shared/domain/usecase/get_profile_usecase.dart';
import 'package:moolah_go/core/shared/domain/usecase/login_usecase.dart';
import 'package:moolah_go/core/usecase/usecase.dart';

class AdsBloc extends Cubit<AdsState> {
  GetAdsUsecase getAdsUsecase;
  GetProfileUsecase getProfileUsecase;

  AdsBloc({required this.getAdsUsecase, required this.getProfileUsecase})
      : super(AdsStateImpl());

  fetchData() async {
    final ads = await getAdsUsecase.call(NoParam());
    final profile = await getProfileUsecase.call(NoParam());

    ads.fold((l) => print(l), (r) => emit(state.copyWith(advertisement: r)));
    profile.fold((l) => print(l), (r) => emit(state.copyWith(user: r)));
  }
}

@immutable
abstract class AdsState extends Equatable {
  User? user;
  Advertisement? advertisement;

  AdsState({required this.user, required this.advertisement});

  AdsState copyWith({User? user, Advertisement? advertisement}) => AdsStateImpl(
      user: user ?? this.user,
      advertisement: advertisement ?? this.advertisement);

  @override
  List<Object?> get props => [user, advertisement];
}

class AdsStateImpl extends AdsState {
  AdsStateImpl({User? user, Advertisement? advertisement})
      : super(user: user, advertisement: advertisement);
}
