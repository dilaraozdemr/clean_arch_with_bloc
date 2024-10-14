import 'dart:convert';
import 'package:harry_potter_clean/data/exceptions/exceptions.dart';
import '../models/characters_response_model.dart';
import "package:http/http.dart" as http;

abstract class PotterRemoteDatasource {
  Future<CharactersResponseModel> getCharacters();
  Future<CharactersResponseModel> getCharactersDetail(String id);
}

class PotterRemoteDatasourceImpl implements PotterRemoteDatasource {
  final http.Client client;

  PotterRemoteDatasourceImpl({required this.client});

  @override
  Future<CharactersResponseModel> getCharacters() async {
    final response = await client.get(
      Uri.parse('https://hp-api.onrender.com/api/characters'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw ServerExceptions();
    } else {
      final jsonResponse = json.decode(response.body);
      var model = CharactersResponseModel.fromJson(jsonResponse);

      List<CharacterModel> characterModels = model.characters
          .map((entity) {
        if (entity is CharacterModel) {
          return entity;
        } else {
          throw Exception('Character is not of type CharacterModel');
        }
      }).toList();

      if (characterModels.length > 50) {
        return CharactersResponseModel(
          characters: characterModels.sublist(0, 50),
        );
      } else {
        return CharactersResponseModel(
          characters: characterModels,
        );
      }
    }
  }

  @override
  Future<CharactersResponseModel> getCharactersDetail(String id) async {
    final response = await client.get(
      Uri.parse('https://hp-api.onrender.com/api/character/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) {
      throw ServerExceptions();
    } else {
      var model = CharactersResponseModel.fromJson(json.decode(response.body));
      return model;
    }
  }

}
