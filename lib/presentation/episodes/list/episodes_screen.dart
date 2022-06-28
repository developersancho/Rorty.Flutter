import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rorty_flutter/app/widgets/app_bar.dart';
import 'package:rorty_flutter/app/widgets/empty_screen.dart';
import 'package:rorty_flutter/app/widgets/error_screen.dart';
import 'package:rorty_flutter/app/widgets/favorite_button.dart';
import 'package:rorty_flutter/app/widgets/loading_screen.dart';
import 'package:rorty_flutter/core/view_state.dart';
import 'package:rorty_flutter/data/model/dto/episode/episode_dto.dart';
import 'package:rorty_flutter/presentation/episodes/detail/episode_detail_screen.dart';
import 'package:stacked/stacked.dart';

import 'episodes_view_model.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EpisodesViewModel>.reactive(
        viewModelBuilder: () => EpisodesViewModel(),
        onModelReady: (viewModel) {
          viewModel.loadData();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: _buildBody(context, viewModel),
          );
        });
  }

  Widget _buildBody(BuildContext context, EpisodesViewModel viewModel) {
    switch (viewModel.viewState.state) {
      case ResponseState.LOADING:
        return const LoadingScreen();
      case ResponseState.COMPLETE:
        final items = viewModel.viewState.data ?? List.empty();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: ListView.builder(
              // if hasMore is true, add one more space for a loading indicator
              itemCount: viewModel.hasMore ? items.length + 1 : items.length,
              itemBuilder: (context, index) {
                if (index >= items.length) {
                  // Don't fire another when one async is currently ongoing
                  if (!viewModel.busy(episodesBusyKey)) {
                    viewModel.loadMoreEpisodes();
                  }

                  return Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 32, bottom: 32),
                      child: const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                return _episodeWidget(items, index, context);
              }),
        );
      case ResponseState.ERROR:
        return const ErrorScreen();
      case ResponseState.EMPTY:
        return const EmptyScreen();
    }
  }

  RortyAppBar _buildAppBar() {
    return RortyAppBar(
      title: tr("episodes"),
    );
  }

  void _navigateDetail(BuildContext context, int? id) {
    context.pushNamed(EpisodeDetailScreen.route, params: {'episodeId': '$id'});
  }

  Widget _episodeWidget(
      List<EpisodeDto> items, int index, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _navigateDetail(context, items[index].id),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        items[index].name ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        items[index].episode ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // Datetime
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].airDate ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          // FavoriteButton(
                          //   iconSize: 26,
                          //   valueChanged: (isFavorite) {
                          //     if (kDebugMode) {
                          //       print('Is Favorite $isFavorite)');
                          //     }
                          //   },
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
