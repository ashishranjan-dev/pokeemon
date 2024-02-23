part of '../home.dart';

class _PokemonNews extends StatelessWidget {
  const _PokemonNews();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider<MoviesBloc>(
                        create: (context) => MoviesBloc()..add(FetchMovies()),
                        child: MoviesPage(),
                      )));
            },
            child: Text("watch movies")),
        SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider<SeriesBloc>(
                        create: (context) => SeriesBloc()..add(FetchSeries()),
                        child: SeriesPage(),
                      )));
            },
            child: Text("watch Series")),
        SizedBox(
          height: 15,
        ),
        _buildHeader(context),
        _buildNews(),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(28, 0, 28, 22),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Pokémon News',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'View All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.indigo,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNews() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 9,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return NewsCard(
          title: 'Pokémon Rumble Rush Arrives Soon',
          time: '15 May 2019',
          thumbnail: AppImages.thumbnail,
        );
      },
    );
  }
}
