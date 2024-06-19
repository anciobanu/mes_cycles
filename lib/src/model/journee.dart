import 'package:hive/hive.dart';

part 'journee.g.dart';

@HiveType(typeId: 0)
class Journee extends HiveObject{
  Journee(this.journee, this.commentaires, this.flux, this.transit, this.ballonnements, this.douleurs, this.jambesLourdes, this.forme, this.libido, this.stress);

  @HiveField(0)
  final DateTime journee;
  @HiveField(1)
  final String? commentaires;
  @HiveField(2)
  final double flux;
  @HiveField(3)
  final double transit;
  @HiveField(4)
  final double ballonnements;
  @HiveField(5)
  final double douleurs;
  @HiveField(6)
  final double jambesLourdes;
  @HiveField(7)
  final double forme;
  @HiveField(8)
  final double libido;
  @HiveField(9)
  final double stress;
}