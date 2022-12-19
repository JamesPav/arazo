import 'package:arazo/models/trapezi_item.dart';

class Trapezi{

  Map<String, List<TrapeziItem>> trapezi;

  Trapezi(
      this.trapezi
      );

  static Trapezi generateTrapezi() {
    return Trapezi(
        {
          "Εσωτερικός Χώρος": TrapeziItem.generateEsoterikoList(),
          "Πατάρι": TrapeziItem.generatePatariList(),
          "Γκαζόν":TrapeziItem.generateGkazonList(),
          "Τέντα":TrapeziItem.generateTentaList(),

        }
    );
  }

}