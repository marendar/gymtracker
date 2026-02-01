import 'package:flutter/services.dart';

class AssetManager {

  static List<String> pathList = [];
  static String iconPath = '';
  static int exerciseId = 0;

  static getListOfImageAssets() async {
    var imageAssets = await getAllAssets();
    imageAssets.removeLast();
    if(imageAssets.isEmpty){
      throw Exception('Keine / Nicht nur Bilder');
    }
    pathList = imageAssets;
  }

  static Future<List<String>> getAllAssets() async {
    final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    if(assetManifest.listAssets().isEmpty){
      throw Exception('Keine Assets');
    }
    return assetManifest.listAssets();
  }

  static setIconPath(String iconPath2) {
    iconPath = iconPath2;
  }

  static setIdToBeDeleted(int id){
    exerciseId = id;
  }
}