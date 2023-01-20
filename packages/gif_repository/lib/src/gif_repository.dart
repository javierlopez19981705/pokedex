import 'package:gif_repository/src/models/gif_model.dart';
import 'package:gif_services/gif_services.dart';

/// {@template gif_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class GifRepository {
  /// {@macro gif_repository}
  GifRepository({
    GifServices? gifServices,
  }) : gifServices = gifServices ?? GifServices();

  ///
  final GifServices gifServices;

  ///Get urls gif's from api
  Future<List<GifModel>> getUrls() async {
    try {
      final resp = await gifServices.fetchGifs();
      return resp.map(GifModel.new).toList();
    } on Exception {
      throw Exception();
    }
  }
}
