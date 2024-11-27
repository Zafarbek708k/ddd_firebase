// To parse this JSON data, do
//
//     final animalModel = animalModelFromJson(jsonString);

import 'dart:convert';

List<AnimalModel> animalModelFromJson(String str) => List<AnimalModel>.from(json.decode(str).map((x) => AnimalModel.fromJson(x)));

String animalModelToJson(List<AnimalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimalModel {
  final String? name;
  final Taxonomy? taxonomy;
  final List<String>? locations;
  final Characteristics? characteristics;

  AnimalModel({
    this.name,
    this.taxonomy,
    this.locations,
    this.characteristics,
  });

  AnimalModel copyWith({
    String? name,
    Taxonomy? taxonomy,
    List<String>? locations,
    Characteristics? characteristics,
  }) =>
      AnimalModel(
        name: name ?? this.name,
        taxonomy: taxonomy ?? this.taxonomy,
        locations: locations ?? this.locations,
        characteristics: characteristics ?? this.characteristics,
      );

  factory AnimalModel.fromJson(Map<String, dynamic> json) => AnimalModel(
    name: json["name"],
    taxonomy: json["taxonomy"] == null ? null : Taxonomy.fromJson(json["taxonomy"]),
    locations: json["locations"] == null ? [] : List<String>.from(json["locations"]!.map((x) => x)),
    characteristics: json["characteristics"] == null ? null : Characteristics.fromJson(json["characteristics"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "taxonomy": taxonomy?.toJson(),
    "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x)),
    "characteristics": characteristics?.toJson(),
  };
}

class Characteristics {
  final String? prey;
  final String? nameOfYoung;
  final String? groupBehavior;
  final String? estimatedPopulationSize;
  final String? biggestThreat;
  final String? mostDistinctiveFeature;
  final String? gestationPeriod;
  final String? habitat;
  final String? diet;
  final String? averageLitterSize;
  final String? lifestyle;
  final String? commonName;
  final String? numberOfSpecies;
  final String? location;
  final String? slogan;
  final String? group;
  final String? color;
  final String? skinType;
  final String? topSpeed;
  final String? lifespan;
  final String? weight;
  final String? height;
  final String? ageOfSexualMaturity;
  final String? ageOfWeaning;

  Characteristics({
    this.prey,
    this.nameOfYoung,
    this.groupBehavior,
    this.estimatedPopulationSize,
    this.biggestThreat,
    this.mostDistinctiveFeature,
    this.gestationPeriod,
    this.habitat,
    this.diet,
    this.averageLitterSize,
    this.lifestyle,
    this.commonName,
    this.numberOfSpecies,
    this.location,
    this.slogan,
    this.group,
    this.color,
    this.skinType,
    this.topSpeed,
    this.lifespan,
    this.weight,
    this.height,
    this.ageOfSexualMaturity,
    this.ageOfWeaning,
  });

  Characteristics copyWith({
    String? prey,
    String? nameOfYoung,
    String? groupBehavior,
    String? estimatedPopulationSize,
    String? biggestThreat,
    String? mostDistinctiveFeature,
    String? gestationPeriod,
    String? habitat,
    String? diet,
    String? averageLitterSize,
    String? lifestyle,
    String? commonName,
    String? numberOfSpecies,
    String? location,
    String? slogan,
    String? group,
    String? color,
    String? skinType,
    String? topSpeed,
    String? lifespan,
    String? weight,
    String? height,
    String? ageOfSexualMaturity,
    String? ageOfWeaning,
  }) =>
      Characteristics(
        prey: prey ?? this.prey,
        nameOfYoung: nameOfYoung ?? this.nameOfYoung,
        groupBehavior: groupBehavior ?? this.groupBehavior,
        estimatedPopulationSize: estimatedPopulationSize ?? this.estimatedPopulationSize,
        biggestThreat: biggestThreat ?? this.biggestThreat,
        mostDistinctiveFeature: mostDistinctiveFeature ?? this.mostDistinctiveFeature,
        gestationPeriod: gestationPeriod ?? this.gestationPeriod,
        habitat: habitat ?? this.habitat,
        diet: diet ?? this.diet,
        averageLitterSize: averageLitterSize ?? this.averageLitterSize,
        lifestyle: lifestyle ?? this.lifestyle,
        commonName: commonName ?? this.commonName,
        numberOfSpecies: numberOfSpecies ?? this.numberOfSpecies,
        location: location ?? this.location,
        slogan: slogan ?? this.slogan,
        group: group ?? this.group,
        color: color ?? this.color,
        skinType: skinType ?? this.skinType,
        topSpeed: topSpeed ?? this.topSpeed,
        lifespan: lifespan ?? this.lifespan,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        ageOfSexualMaturity: ageOfSexualMaturity ?? this.ageOfSexualMaturity,
        ageOfWeaning: ageOfWeaning ?? this.ageOfWeaning,
      );

  factory Characteristics.fromJson(Map<String, dynamic> json) => Characteristics(
    prey: json["prey"],
    nameOfYoung: json["name_of_young"],
    groupBehavior: json["group_behavior"],
    estimatedPopulationSize: json["estimated_population_size"],
    biggestThreat: json["biggest_threat"],
    mostDistinctiveFeature: json["most_distinctive_feature"],
    gestationPeriod: json["gestation_period"],
    habitat: json["habitat"],
    diet: json["diet"],
    averageLitterSize: json["average_litter_size"],
    lifestyle: json["lifestyle"],
    commonName: json["common_name"],
    numberOfSpecies: json["number_of_species"],
    location: json["location"],
    slogan: json["slogan"],
    group: json["group"],
    color: json["color"],
    skinType: json["skin_type"],
    topSpeed: json["top_speed"],
    lifespan: json["lifespan"],
    weight: json["weight"],
    height: json["height"],
    ageOfSexualMaturity: json["age_of_sexual_maturity"],
    ageOfWeaning: json["age_of_weaning"],
  );

  Map<String, dynamic> toJson() => {
    "prey": prey,
    "name_of_young": nameOfYoung,
    "group_behavior": groupBehavior,
    "estimated_population_size": estimatedPopulationSize,
    "biggest_threat": biggestThreat,
    "most_distinctive_feature": mostDistinctiveFeature,
    "gestation_period": gestationPeriod,
    "habitat": habitat,
    "diet": diet,
    "average_litter_size": averageLitterSize,
    "lifestyle": lifestyle,
    "common_name": commonName,
    "number_of_species": numberOfSpecies,
    "location": location,
    "slogan": slogan,
    "group": group,
    "color": color,
    "skin_type": skinType,
    "top_speed": topSpeed,
    "lifespan": lifespan,
    "weight": weight,
    "height": height,
    "age_of_sexual_maturity": ageOfSexualMaturity,
    "age_of_weaning": ageOfWeaning,
  };
}

class Taxonomy {
  final String? kingdom;
  final String? phylum;
  final String? taxonomyClass;
  final String? order;
  final String? family;
  final String? genus;
  final String? scientificName;

  Taxonomy({
    this.kingdom,
    this.phylum,
    this.taxonomyClass,
    this.order,
    this.family,
    this.genus,
    this.scientificName,
  });

  Taxonomy copyWith({
    String? kingdom,
    String? phylum,
    String? taxonomyClass,
    String? order,
    String? family,
    String? genus,
    String? scientificName,
  }) =>
      Taxonomy(
        kingdom: kingdom ?? this.kingdom,
        phylum: phylum ?? this.phylum,
        taxonomyClass: taxonomyClass ?? this.taxonomyClass,
        order: order ?? this.order,
        family: family ?? this.family,
        genus: genus ?? this.genus,
        scientificName: scientificName ?? this.scientificName,
      );

  factory Taxonomy.fromJson(Map<String, dynamic> json) => Taxonomy(
    kingdom: json["kingdom"],
    phylum: json["phylum"],
    taxonomyClass: json["class"],
    order: json["order"],
    family: json["family"],
    genus: json["genus"],
    scientificName: json["scientific_name"],
  );

  Map<String, dynamic> toJson() => {
    "kingdom": kingdom,
    "phylum": phylum,
    "class": taxonomyClass,
    "order": order,
    "family": family,
    "genus": genus,
    "scientific_name": scientificName,
  };
}
