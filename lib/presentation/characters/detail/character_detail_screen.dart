import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rorty_flutter/app/di/injector.dart';
import 'package:rorty_flutter/app/widgets/app_bar.dart';
import 'package:rorty_flutter/app/widgets/character_status_view.dart';
import 'package:rorty_flutter/app/widgets/empty_screen.dart';
import 'package:rorty_flutter/app/widgets/error_screen.dart';
import 'package:rorty_flutter/app/widgets/loading_screen.dart';
import 'package:rorty_flutter/core/view_state.dart';
import 'package:rorty_flutter/data/model/dto/episode/episode_dto.dart';
import 'package:rorty_flutter/presentation/episodes/detail/episode_detail_screen.dart';
import 'package:rorty_flutter/presentation/locations/detail/location_detail_screen.dart';

import 'character_detail_view_model.dart';

class CharacterDetailScreen extends StatefulWidget {
  static const route = '/characterDetail/:characterId';

  final String characterId;

  const CharacterDetailScreen({Key? key, required this.characterId})
      : super(key: key);

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  CharacterDetailViewModel viewModel = injector<CharacterDetailViewModel>();

  @override
  void initState() {
    viewModel.loadCharacterDetail(int.parse(widget.characterId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CharacterDetailViewModel>(
        create: (context) => viewModel,
        child: Consumer<CharacterDetailViewModel>(
            builder: (context, value, child) {
          return Scaffold(appBar: _buildAppBar(), body: _buildBody());
        }));
  }

  Widget _buildBody() {
    switch (viewModel.viewState.state) {
      case ResponseState.LOADING:
        return const LoadingScreen();
      case ResponseState.COMPLETE:
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildCharacterImage(),
              _buildCharacterInformation(),
            ],
          ),
        );
      case ResponseState.ERROR:
        return const ErrorScreen();
      case ResponseState.EMPTY:
        return const EmptyScreen();
    }
  }

  Widget _buildCharacterImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                    image: NetworkImage(
                      "${viewModel.dto?.image}",
                    ),
                    fit: BoxFit.cover))),
      ],
    );
  }

  Widget _buildCharacterInformation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildTitle(tr("information")),
        _buildCharacterStatusView(),
        _buildRowView(tr("name"), viewModel.dto?.name ?? "", true, false),
        _buildRowView(tr("species"), viewModel.dto?.species ?? "", true, false),
        _buildRowView(tr("gender"), viewModel.dto?.gender ?? "", false, false),
        _buildTitle(tr("location")),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _navigateLocationDetail(
              context, viewModel.dto?.origin?.locationId),
          child: _buildRowView(tr("last_know_location"),
              viewModel.dto?.origin?.name ?? "", true, true),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _navigateLocationDetail(
              context, viewModel.dto?.location?.locationId),
          child: _buildRowView(
              tr("location"), viewModel.dto?.location?.name ?? "", false, true),
        ),
        _buildTitle(tr("episodes")),
        _buildEpisodes(viewModel.dto?.episodeDtoList ?? List.empty())
      ],
    );
  }

  Widget _buildRowView(
      String key, String value, bool showDivider, bool showArrow) {
    return Card(
      shape: const RoundedRectangleBorder(),
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      key,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        value,
                        style: TextStyle(fontWeight: FontWeight.w500),
                        softWrap: false,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                      if (showArrow)
                        IconButton(
                          iconSize: 18,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(
                            Icons.arrow_right,
                          ),
                          onPressed: () {
                            print("ccc");
                          },
                        ),
                    ],
                  )
                ],
              ),
            ),
            if (showDivider) _dividerView()
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterStatusView() {
    return Card(
      shape: const RoundedRectangleBorder(),
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CharacterStatusView(
              status: viewModel.dto?.status ?? "",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  RortyAppBarWithBack _buildAppBar() {
    return RortyAppBarWithBack(title: tr("character_detail"));
  }

  _navigateLocationDetail(BuildContext context, int? id) {
    context
        .pushNamed(LocationDetailScreen.route, params: {'locationId': '$id'});
  }

  _navigateEpisodeDetail(BuildContext context, int? id) {
    context.pushNamed(EpisodeDetailScreen.route, params: {'episodeId': '$id'});
  }

  Widget _buildEpisodes(List<EpisodeDto> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _navigateEpisodeDetail(context, list[index].id),
          child: _buildEpisodeRowView(list[index]),
        );
      },
    );
  }

  Widget _buildEpisodeRowView(EpisodeDto dto) {
    return Card(
      shape: const RoundedRectangleBorder(),
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${dto.name}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${dto.episode}",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  IconButton(
                    iconSize: 18,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_right,
                    ),
                    onPressed: () {
                      print("ccc");
                    },
                  ),
                ],
              ),
              _dividerView()
            ],
          )),
    );
  }

  Widget _dividerView() {
    return const Padding(
      padding: EdgeInsets.only(top: 8),
      child: Divider(
        height: 1,
        thickness: 1.0,
      ),
    );
  }
}
