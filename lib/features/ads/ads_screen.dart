import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moolah_go/core/shared/domain/usecase/get_ads_usecase.dart';
import 'package:moolah_go/core/shared/domain/usecase/get_profile_usecase.dart';
import 'package:moolah_go/core/widgets/app_textfield.dart';
import 'package:moolah_go/features/ads/ads_bloc.dart';

class AdsScreen extends StatefulWidget {
  static initiateScreen() => BlocProvider(
        create: (_) => AdsBloc(
            getAdsUsecase: GetIt.I<GetAdsUsecase>(),
            getProfileUsecase: GetIt.I<GetProfileUsecase>()),
        child: AdsScreen(),
      );

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<AdsBloc>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    context.read<AdsBloc>().fetchData();
    return BlocConsumer<AdsBloc, AdsState>(
        builder: (_, state) {
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                leading: state.user != null
                    ? CachedNetworkImage(
                        imageUrl: state.user!.data.photo,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Container(),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage("assets/images/logo.png"))),
                    ),
                    Text(
                      state.user == null ? "" : state.user!.data.userName,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
                backgroundColor: Colors.transparent,
              ),
              body: LayoutBuilder(builder: (_, constraints) {
                return SingleChildScrollView(
                    child: state.advertisement != null
                        ? Wrap(
                            children: state.advertisement!.payload
                                .map((e) => Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 10,
                                                spreadRadius: 1)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: e.imagePath,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Align(
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            e.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              width: 150, child: Text(e.body))
                                        ],
                                      ),
                                    ))
                                .toList(),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ));
              }));
        },
        listener: (_, state) {});
  }
}
