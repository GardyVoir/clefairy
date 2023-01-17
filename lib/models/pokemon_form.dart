class Forms {
  int? id;
  String? name;
  int? order;
  int? formOrder;
  bool? isDefault;
  bool? isBattleOnly;
  bool? isMega;
  String? formName;
  Pokemon? pokemon;
  Sprites? sprites;
  List<Types>? types;
  Pokemon? versionGroup;

  Forms(
      {this.id,
      this.name,
      this.order,
      this.formOrder,
      this.isDefault,
      this.isBattleOnly,
      this.isMega,
      this.formName,
      this.pokemon,
      this.sprites,
      this.types,
      this.versionGroup});

  Forms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    formOrder = json['form_order'];
    isDefault = json['is_default'];
    isBattleOnly = json['is_battle_only'];
    isMega = json['is_mega'];
    formName = json['form_name'];
    pokemon = json['pokemon'] != null ? Pokemon.fromJson(json['pokemon']) : null;
    sprites = json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    versionGroup = json['version_group'] != null ? Pokemon.fromJson(json['version_group']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['form_order'] = formOrder;
    data['is_default'] = isDefault;
    data['is_battle_only'] = isBattleOnly;
    data['is_mega'] = isMega;
    data['form_name'] = formName;
    if (pokemon != null) {
      data['pokemon'] = pokemon!.toJson();
    }
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    return data;
  }
}

class Pokemon {
  String? name;
  String? url;

  Pokemon({this.name, this.url});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Sprites {
  String? backDefault;
  Null? backFemale;
  String? backShiny;
  Null? backShinyFemale;
  String? frontDefault;
  Null? frontFemale;
  String? frontShiny;
  Null? frontShinyFemale;

  Sprites(
      {this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale});

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_female'] = backFemale;
    data['back_shiny'] = backShiny;
    data['back_shiny_female'] = backShinyFemale;
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    data['front_shiny'] = frontShiny;
    data['front_shiny_female'] = frontShinyFemale;
    return data;
  }
}

class Types {
  int? slot;
  Pokemon? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? Pokemon.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}
