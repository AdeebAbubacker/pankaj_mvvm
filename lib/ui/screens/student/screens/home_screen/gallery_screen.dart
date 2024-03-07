import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/ui/view_model/get_gallery/get_gallery_bloc.dart';
import 'package:shimmer/shimmer.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<GetGalleryBloc>(context)
          .add(const GetGalleryEvent.getGalleryimage());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GetGalleryBloc, GetGalleryState>(
          builder: (context, state) {
            if (state.isError) {
              // ignore: avoid_print
              return _buildShimmerforGAllery();
            } else if (state.isLoading) {
              // ignore: avoid_print
              print('loading');
              return _buildShimmerforGAllery();
            }
            // ignore: avoid_print
            print('success');
            if (state.gallery.data == null) {
              return Text('data');
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: state.gallery.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final image = state.gallery.data![index].images;
                  final imageUrl = image;

                  // Define startTime when the image loading starts
                  final startTime = DateTime.now();

                  return SizedBox(
                    width: 200,
                    height: 220,
                    child: Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          // Image has been fully loaded
                          final endTime = DateTime.now();
                          final loadingDuration = endTime.difference(startTime);
                          return Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          );
                        } else {
                          // // Image is still loading, you can show a loading indicator if needed
                          return _buildShimmerforGAllery1();
                        }
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildShimmerforGAllery() {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 220, 215, 215),
      highlightColor: const Color.fromARGB(255, 230, 215, 215),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 0.5,
          mainAxisSpacing: 0.6,
        ),
        itemCount: 1,
        itemBuilder: (context, index) {
          return GridTile(
            child: Container(
              width: 200,
              height: 220,
              color: const Color.fromARGB(255, 186, 173, 173),
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmerforGAllery1() {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 220, 215, 215),
      highlightColor: const Color.fromARGB(255, 230, 215, 215),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 220,
          color: const Color.fromARGB(255, 186, 173, 173),
        ),
      ),
    );
  }
}

class GalleryImage {
  final int id;
  final String name;
  final String imageUrl;

  GalleryImage({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}
