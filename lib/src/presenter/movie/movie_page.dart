import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/presenter/movie/state/movie_state.dart';
import 'movie_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends ModularState<MoviePage, MovieController> {
  @override
  void initState() {
    controller.showMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedBuilder(
            animation: controller,
            builder: (context, snapshot) {
              return Text(controller.title);
            }),
        actions: [
          AnimatedBuilder(
              animation: controller,
              builder: (context, snapshot) {
                return PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text(controller.a),
                      value: controller.a,
                    ),
                    PopupMenuItem(
                      child: Text(controller.b),
                      value: controller.b,
                    ),
                    PopupMenuItem(
                      child: Text(controller.c),
                      value: controller.c,
                    ),
                    PopupMenuItem(
                      child: Text(controller.d),
                      value: controller.d,
                    ),
                  ],
                  onSelected: (String newValue) {
                    controller.changeTitle(newValue);
                  },
                );
              })
        ],
      ),
      body: ValueListenableBuilder<MovieState>(
          valueListenable: controller,
          builder: (context, state, child) {
            return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loaded: (movies) {
                  return ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (_, i) {
                      var movie = movies[i];

                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(movie.id.toString()),
                        ),
                        title: Text(movie.title),
                      );
                    },
                  );
                },
                error: (error) => const Text('deu erro'));
          }),
    );
  }
}
