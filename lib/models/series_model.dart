// To parse this JSON data, do
//
//     final seriesData = seriesDataFromJson(jsonString);

import 'dart:convert';

List<SeriesData> seriesDataFromJson(String str) =>
    List<SeriesData>.from(json.decode(str).map((x) => SeriesData.fromJson(x)));

String seriesDataToJson(List<SeriesData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SeriesData {
  String? channelId;
  String? channelIdExt;
  String? channelName;
  String? channelDescription;
  ChannelImages? channelImages;
  int? categoryId;
  Category? category;
  int? order;
  int? channelCreationDate;
  int? channelUpdateDate;
  List<SeriesMedia>? media;

  SeriesData({
    this.channelId,
    this.channelIdExt,
    this.channelName,
    this.channelDescription,
    this.channelImages,
    this.categoryId,
    this.category,
    this.order,
    this.channelCreationDate,
    this.channelUpdateDate,
    this.media,
  });

  factory SeriesData.fromJson(Map<String, dynamic> json) => SeriesData(
        channelId: json["channel_id"],
        channelIdExt: json["channel_id_ext"],
        channelName: json["channel_name"],
        channelDescription: json["channel_description"],
        channelImages: json["channel_images"] == null
            ? null
            : ChannelImages.fromJson(json["channel_images"]),
        categoryId: json["category_id"],
        category: categoryValues.map[json["category"]]!,
        order: json["order"],
        channelCreationDate: json["channel_creation_date"],
        channelUpdateDate: json["channel_update_date"],
        media: json["media"] == null
            ? []
            : List<SeriesMedia>.from(
                json["media"]!.map((x) => SeriesMedia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "channel_id": channelId,
        "channel_id_ext": channelIdExt,
        "channel_name": channelName,
        "channel_description": channelDescription,
        "channel_images": channelImages?.toJson(),
        "category_id": categoryId,
        "category": categoryValues.reverse[category],
        "order": order,
        "channel_creation_date": channelCreationDate,
        "channel_update_date": channelUpdateDate,
        "media": media == null
            ? []
            : List<dynamic>.from(media!.map((x) => x.toJson())),
      };
}

enum Category { SERIES }

final categoryValues = EnumValues({"Series": Category.SERIES});

class ChannelImages {
  String? dashboardImage11251500;
  String? spotlightImage9601277;
  String? spotlightImage20481152;
  String? spotlightImage1660940;
  String? spotlightImage2732940;

  ChannelImages({
    this.dashboardImage11251500,
    this.spotlightImage9601277,
    this.spotlightImage20481152,
    this.spotlightImage1660940,
    this.spotlightImage2732940,
  });

  factory ChannelImages.fromJson(Map<String, dynamic> json) => ChannelImages(
        dashboardImage11251500: json["dashboard_image_1125_1500"],
        spotlightImage9601277: json["spotlight_image_960_1277"],
        spotlightImage20481152: json["spotlight_image_2048_1152"],
        spotlightImage1660940: json["spotlight_image_1660_940"],
        spotlightImage2732940: json["spotlight_image_2732_940"],
      );

  Map<String, dynamic> toJson() => {
        "dashboard_image_1125_1500": dashboardImage11251500,
        "spotlight_image_960_1277": spotlightImage9601277,
        "spotlight_image_2048_1152": spotlightImage20481152,
        "spotlight_image_1660_940": spotlightImage1660940,
        "spotlight_image_2732_940": spotlightImage2732940,
      };
}

class SeriesMedia {
  String? id;
  String? season;
  String? episode;
  String? title;
  String? description;
  Images? images;
  String? streamUrl;
  String? captions;
  String? offlineUrl;
  int? size;

  SeriesMedia({
    this.id,
    this.season,
    this.episode,
    this.title,
    this.description,
    this.images,
    this.streamUrl,
    this.captions,
    this.offlineUrl,
    this.size,
  });

  factory SeriesMedia.fromJson(Map<String, dynamic> json) => SeriesMedia(
        id: json["id"],
        season: json["season"],
        episode: json["episode"],
        title: json["title"],
        description: json["description"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        streamUrl: json["stream_url"],
        captions: json["captions"],
        offlineUrl: json["offline_url"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "season": season,
        "episode": episode,
        "title": title,
        "description": description,
        "images": images?.toJson(),
        "stream_url": streamUrl,
        "captions": captions,
        "offline_url": offlineUrl,
        "size": size,
      };
}

class Images {
  String? small;
  String? large;
  String? medium;

  Images({
    this.small,
    this.large,
    this.medium,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: json["small"],
        large: json["large"],
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
        "medium": medium,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
