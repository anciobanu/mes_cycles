import 'package:hive/hive.dart';

part 'journee.g.dart';

@HiveType(typeId: 0)
class Journee extends HiveObject{
  Journee(this.journee, this.flux, this.transit, this.ballonnements, this.jambesLourdes, this.forme, this.libido, this.stress, this.commentaires);

  @HiveField(0)
  final DateTime journee;
  @HiveField(1)
  final double flux;
  @HiveField(2)
  final double transit;
  @HiveField(3)
  final double ballonnements;
  @HiveField(4)
  final double jambesLourdes;
  @HiveField(5)
  final double forme;
  @HiveField(6)
  final double libido;
  @HiveField(7)
  final double stress;
  @HiveField(8)
  final String? commentaires;
}