import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rorty_flutter/app/widgets/app_bar.dart';
import 'package:rorty_flutter/app/widgets/character_status_view.dart';
import 'package:rorty_flutter/app/widgets/empty_screen.dart';
import 'package:rorty_flutter/app/widgets/error_screen.dart';
import 'package:rorty_flutter/app/widgets/favorite_button.dart';
import 'package:rorty_flutter/app/widgets/loading_screen.dart';
import 'package:rorty_flutter/core/view_state.dart';
import 'package:rorty_flutter/data/model/dto/character/character_dto.dart';
import 'package:rorty_flutter/presentation/characters/detail/character_detail_screen.dart';
import 'package:stacked/stacked.dart';

import 'characters_view_model.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CharactersViewModel>.reactive(
        viewModelBuilder: () => CharactersViewModel(),
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

  Widget _buildBody(BuildContext context, CharactersViewModel viewModel) {
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
                  if (!viewModel.busy(charactersBusyKey)) {
                    viewModel.loadMoreCharacters();
                  }

                  return Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 32, bottom: 32),
                      child: const SizedBox(
                        child: CircularProgressIndicator(),
                        height: 24,
                        width: 24,
                      ),
                    ),
                  );
                }
                return _characterWidget(items, index, context);
              }),
        );
      case ResponseState.ERROR:
        return const ErrorScreen();
      case ResponseState.EMPTY:
        return const EmptyScreen();
    }
  }

  Widget _characterWidget(
      List<CharacterDto> items, int index, BuildContext context) {
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
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: NetworkImage(
                          "${items[index].image}",
                        ),
                        fit: BoxFit.cover)),
              ),
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
                        items[index].species ?? '',
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
                          CharacterStatusView(
                            status: items[index].status ?? "",
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

  void _navigateDetail(BuildContext context, int? id) {
    context
        .pushNamed(CharacterDetailScreen.route, params: {'characterId': '$id'});
  }

  RortyAppBar _buildAppBar() {
    return RortyAppBar(
      title: tr("characters"),
    );
  }
}
