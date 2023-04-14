class LocationAreaEncounter {
  LocationArea? locationArea;
  List<VersionDetails>? versionDetails;

  LocationAreaEncounter({this.locationArea, this.versionDetails});

  LocationAreaEncounter.fromJson(Map<String, dynamic> json) {
    locationArea = json['location_area'] != null ? new LocationArea.fromJson(json['location_area']) : null;
    if (json['version_details'] != null) {
      versionDetails = <VersionDetails>[];
      json['version_details'].forEach((v) {
        versionDetails!.add(new VersionDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.locationArea != null) {
      data['location_area'] = this.locationArea!.toJson();
    }
    if (this.versionDetails != null) {
      data['version_details'] = this.versionDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationArea {
  String? name;
  String? url;

  LocationArea({this.name, this.url});

  LocationArea.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class VersionDetails {
  int? maxChance;
  List<EncounterDetails>? encounterDetails;
  LocationArea? version;

  VersionDetails({this.maxChance, this.encounterDetails, this.version});

  VersionDetails.fromJson(Map<String, dynamic> json) {
    maxChance = json['max_chance'];
    if (json['encounter_details'] != null) {
      encounterDetails = <EncounterDetails>[];
      json['encounter_details'].forEach((v) {
        encounterDetails!.add(new EncounterDetails.fromJson(v));
      });
    }
    version = json['version'] != null ? new LocationArea.fromJson(json['version']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max_chance'] = this.maxChance;
    if (this.encounterDetails != null) {
      data['encounter_details'] = this.encounterDetails!.map((v) => v.toJson()).toList();
    }
    if (this.version != null) {
      data['version'] = this.version!.toJson();
    }
    return data;
  }
}

class EncounterDetails {
  int? minLevel;
  int? maxLevel;
  List<ConditionValues>? conditionValues;
  int? chance;
  LocationArea? method;

  EncounterDetails({this.minLevel, this.maxLevel, this.conditionValues, this.chance, this.method});

  EncounterDetails.fromJson(Map<String, dynamic> json) {
    minLevel = json['min_level'];
    maxLevel = json['max_level'];
    if (json['condition_values'] != null) {
      conditionValues = <ConditionValues>[];
      json['condition_values'].forEach((v) {
        conditionValues!.add(new ConditionValues.fromJson(v));
      });
    }
    chance = json['chance'];
    method = json['method'] != null ? new LocationArea.fromJson(json['method']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min_level'] = this.minLevel;
    data['max_level'] = this.maxLevel;
    if (this.conditionValues != null) {
      data['condition_values'] = this.conditionValues!.map((v) => v.toJson()).toList();
    }
    data['chance'] = this.chance;
    if (this.method != null) {
      data['method'] = this.method!.toJson();
    }
    return data;
  }
}

class ConditionValues {
  int? id;
  String? name;
  Condition? condition;
  List<Names>? names;

  ConditionValues({this.id, this.name, this.condition, this.names});

  ConditionValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    condition = json['condition'] != null ? new Condition.fromJson(json['condition']) : null;
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(new Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Condition {
  String? name;
  String? url;

  Condition({this.name, this.url});

  Condition.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Names {
  String? name;
  Condition? language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null ? new Condition.fromJson(json['language']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }
}
