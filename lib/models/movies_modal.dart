import 'dart:convert';

List<MoviesData> moviesDataFromJson(String str) =>
    List<MoviesData>.from(json.decode(str).map((x) => MoviesData.fromJson(x)));

String moviesDataToJson(List<MoviesData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoviesData {
  String channelDescription;
  bool stuntChannel;
  String channelName;
  List<MovieMedia> media;
  int channelCreationDate;
  dynamic whatsNewOrder;
  int watchNowOrder;
  String channelId;
  ChannelImages channelImages;
  int channelUpdateDate;
  MediaType mediaType;
  String channelStatus;

  MoviesData({
    required this.channelDescription,
    required this.stuntChannel,
    required this.channelName,
    required this.media,
    required this.channelCreationDate,
    required this.whatsNewOrder,
    required this.watchNowOrder,
    required this.channelId,
    required this.channelImages,
    required this.channelUpdateDate,
    required this.mediaType,
    required this.channelStatus,
  });

  factory MoviesData.fromJson(Map<String, dynamic> json) => MoviesData(
        channelDescription: json["channel_description"],
        stuntChannel: json["stunt_channel"],
        channelName: json["channel_name"],
        media: List<MovieMedia>.from(json["media"].map((x) => MovieMedia.fromJson(x))),
        channelCreationDate: json["channel_creation_date"],
        whatsNewOrder: json["whats_new_order"],
        watchNowOrder: json["watch_now_order"],
        channelId: json["channel_id"],
        channelImages: ChannelImages.fromJson(json["channel_images"]),
        channelUpdateDate: json["channel_update_date"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        channelStatus: json["channel_status"],
      );

  Map<String, dynamic> toJson() => {
        "channel_description": channelDescription,
        "stunt_channel": stuntChannel,
        "channel_name": channelName,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "channel_creation_date": channelCreationDate,
        "whats_new_order": whatsNewOrder,
        "watch_now_order": watchNowOrder,
        "channel_id": channelId,
        "channel_images": channelImages.toJson(),
        "channel_update_date": channelUpdateDate,
        "media_type": mediaTypeValues.reverse[mediaType],
        "channel_status": channelStatus,
      };
}

class ChannelImages {
  String dashboardImage11251500;
  String spotlightImage9601277;
  String spotlightImage20481152;
  String spotlightImage1660940;
  String spotlightImage2732940;

  ChannelImages({
    required this.dashboardImage11251500,
    required this.spotlightImage9601277,
    required this.spotlightImage20481152,
    required this.spotlightImage1660940,
    required this.spotlightImage2732940,
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

class MovieMedia {
  String episode;
  String description;
  bool isCountryWhitelist;
  String title;
  String season;
  Images images;
  String skimmingThumbnailUrlBase;
  bool isNew;
  List<String> countryCodes;
  String offlineUrl;
  int lastModified;
  String streamUrl;
  String captions;
  String id;
  int size;

  MovieMedia({
    required this.episode,
    required this.description,
    required this.isCountryWhitelist,
    required this.title,
    required this.season,
    required this.images,
    required this.skimmingThumbnailUrlBase,
    required this.isNew,
    required this.countryCodes,
    required this.offlineUrl,
    required this.lastModified,
    required this.streamUrl,
    required this.captions,
    required this.id,
    required this.size,
  });

  factory MovieMedia.fromJson(Map<String, dynamic> json) => MovieMedia(
        episode: json["episode"],
        description: json["description"],
        isCountryWhitelist: json["is_country_whitelist"],
        title: json["title"],
        season: json["season"],
        images: Images.fromJson(json["images"]),
        skimmingThumbnailUrlBase: json["skimming_thumbnail_url_base"],
        isNew: json["is_new"],
        countryCodes: List<String>.from(json["country_codes"].map((x) => x)),
        offlineUrl: json["offline_url"],
        lastModified: json["last_modified"],
        streamUrl: json["stream_url"],
        captions: json["captions"],
        id: json["id"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "episode": episode,
        "description": description,
        "is_country_whitelist": isCountryWhitelist,
        "title": title,
        "season": season,
        "images": images.toJson(),
        "skimming_thumbnail_url_base": skimmingThumbnailUrlBase,
        "is_new": isNew,
        "country_codes": List<dynamic>.from(countryCodes.map((x) => x)),
        "offline_url": offlineUrl,
        "last_modified": lastModified,
        "stream_url": streamUrl,
        "captions": captions,
        "id": id,
        "size": size,
      };
}

class Images {
  String small;
  String large;
  String medium;

  Images({
    required this.small,
    required this.large,
    required this.medium,
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

enum MediaType { MOVIE }

final mediaTypeValues = EnumValues({"movie": MediaType.MOVIE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
