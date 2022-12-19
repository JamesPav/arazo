class CatalogItem {
  String name;
  String desc;
  num price;
  num quantity;
  List<Map<String, String>> ingredients;
  bool highlight;

  CatalogItem(this.name, this.desc, this.price, this.quantity, this.ingredients,
      {this.highlight = false});

  static List<CatalogItem> generateCatalogItemList() {
    return [
      CatalogItem("Αρκούδος", "", 5, 1, []),
      CatalogItem("Αράζω", "", 5, 1, []),
      CatalogItem("Μεσογειακή", "", 5, 1, []),
      CatalogItem("Πράσινη", "", 4, 1, []),
      CatalogItem("Παντζάρι", "", 4, 1, []),
      CatalogItem("Αγγουροντομάτα", "", 4, 1, []),
      CatalogItem("Χωριάτικη", "", 6, 1, []),
      CatalogItem("Ποπάυ", "", 5, 1, []),
      CatalogItem("Μελιτζάνα στα κάρβουνα", "", 5, 1, []),
      CatalogItem("Μπρόκολο", "", 4, 1, []),
      CatalogItem("Φλωρίνης", "", 4, 1, []),
      CatalogItem("Πικάντικη", "", 3.5, 1, []),
      CatalogItem("Πατατοσαλάτα", "", 4, 1, []),
      CatalogItem("Χόρτα", "", 4, 1, []),
    ];
  }

  static List<CatalogItem> generateOrektikaList() {
    return [
      CatalogItem(
        "Σαλάτα ΦΠΑ",
        "Σπανάκι baby, σως γιαουρτιού, κρουτόν, κουκουνάρι, καρύδι, φλ. καρότου & παρμεζάνα",
        6,
        1,
        [],
      ),
      CatalogItem(
        "Ρόκα - Μαρούλι",
        "με μπέικον, κρουτόν, ντοματίνια, παρμεζάνα & κρ. βαλσάμικου",
        6,
        1,
        [],
      ),
      CatalogItem(
        "Κοτοσαλάτα",
        "Μαρούλι, κοτόπουλο, καλαμπόκι, κρουτόν, Ceasar' sauce",
        6,
        1,
        [],
      ),
      CatalogItem(
        "Χωριάτικη",
        "",
        6,
        1,
        [],
      ),
      CatalogItem(
        "Αγγουρονομάτα",
        "",
        4,
        1,
        [],
      ),
      CatalogItem(
        "Μαρουλοσαλάτα",
        "",
        3,
        1,
        [],
      ),
      CatalogItem(
        "Πιπεριές Φλωρίνης",
        "",
        3.5,
        1,
        [],
      ),
      CatalogItem(
        "Καυτερή πιπεριά",
        "",
        1.5,
        1,
        [],
      ),
      CatalogItem(
        "Τυροκαφτερό χειροποίητο",
        "",
        3.5,
        1,
        [],
      ),
      CatalogItem(
        "Τζατζίκι",
        "",
        3,
        1,
        [],
      ),
      CatalogItem(
        "Πικάντικη",
        "",
        3.5,
        1,
        [],
      ),
      CatalogItem(
        "Χόρτα",
        "",
        3.5,
        1,
        [],
      ),
      CatalogItem(
        "Πατζάρια",
        "",
        3.5,
        1,
        [],
      ),
      CatalogItem(
        "Μπρόκολο",
        "",
        3.5,
        1,
        [],
      ),
      CatalogItem(
        "Mix Βραστών",
        "",
        6,
        1,
        [],
      ),
    ];
  }

  static List<CatalogItem> generateGastresList() {
    return [
      CatalogItem("Μπιφτέκι χειροποίητο", "", 6.5, 1, []),
      CatalogItem("Σουβλάκι χοιρινό", "", 6.5, 1, []),
      CatalogItem("Σουβλάκι Κοτόπουλο", "", 7, 1, []),
      CatalogItem("Πανσέτα", "", 6.5, 1, []),
      CatalogItem("Κοψίδια Χοιρινά", "", 8, 1, []),
      CatalogItem("Παϊδάκια Αρνίσια", "", 12, 1, []),
      CatalogItem("Συκώτι Μοσχαρίσιο", "", 7, 1, []),
      CatalogItem("Λουκάνικο Χωριάτικο", "", 6, 1, []),
      CatalogItem("Τηγανιά Χοιρινή ΦΠΑ", "", 7, 1, []),
      CatalogItem("Τηγανιά Κοτόπουλο ΦΠΑ", "", 7, 1, []),
      CatalogItem("Τηγανιά Ανάμεικτη ΦΠΑ", "", 7, 1, []),
      CatalogItem("Τηγανιά Κοτόπουλο αλα κρεμ", "", 10, 1, []),
    ];
  }

  static List<CatalogItem> generateSouvlaList() {
    return [
      CatalogItem("Σαρδέλα Σχάρας", "", 7, 1, []),
      CatalogItem("Γαύρος Τηγανιτός", "", 6, 1, []),
      CatalogItem("Μπακαλιάρος Σκορδαλιά", "", 7.5, 1, []),
      CatalogItem("Καλαμαράκια Τηγανιτά", "", 7.5, 1, []),
      CatalogItem("Χταπόδι Ψητό", "", 12, 1, []),
      CatalogItem("Σουβλάκι Γαρίδας στη σχάρα", "", 10, 1, []),
      CatalogItem("Γαρίδες Σαγανάκι", "", 12, 1, []),
      CatalogItem("Μύδια Σαγανάκι", "", 8, 1, []),
      CatalogItem("Φέτα Σολωμού", "", 12, 1, []),
      CatalogItem("Κουτσομούρες", "", 7, 1, []),
      CatalogItem("Τσιπούρα Ψητή", "", 12, 1, []),
    ];
  }

  static List<CatalogItem> generateOrasList() {
    return [
      CatalogItem("Σαρδέλα Σχάρας", "", 7, 1, []),
      CatalogItem("Γαύρος Τηγανιτός", "", 6, 1, []),
      CatalogItem("Μπακαλιάρος Σκορδαλιά", "", 7.5, 1, []),
      CatalogItem("Καλαμαράκια Τηγανιτά", "", 7.5, 1, []),
      CatalogItem("Χταπόδι Ψητό", "", 12, 1, []),
      CatalogItem("Σουβλάκι Γαρίδας στη σχάρα", "", 10, 1, []),
      CatalogItem("Γαρίδες Σαγανάκι", "", 12, 1, []),
      CatalogItem("Μύδια Σαγανάκι", "", 8, 1, []),
      CatalogItem("Φέτα Σολωμού", "", 12, 1, []),
      CatalogItem("Κουτσομούρες", "", 7, 1, []),
      CatalogItem("Τσιπούρα Ψητή", "", 12, 1, []),
    ];
  }

  static List<CatalogItem> generatePotaList() {
    return [
      CatalogItem("Σαρδέλα Σχάρας", "", 7, 1, []),
      CatalogItem("Γαύρος Τηγανιτός", "", 6, 1, []),
      CatalogItem("Μπακαλιάρος Σκορδαλιά", "", 7.5, 1, []),
      CatalogItem("Καλαμαράκια Τηγανιτά", "", 7.5, 1, []),
      CatalogItem("Χταπόδι Ψητό", "", 12, 1, []),
      CatalogItem("Σουβλάκι Γαρίδας στη σχάρα", "", 10, 1, []),
      CatalogItem("Γαρίδες Σαγανάκι", "", 12, 1, []),
      CatalogItem("Μύδια Σαγανάκι", "", 8, 1, []),
      CatalogItem("Φέτα Σολωμού", "", 12, 1, []),
      CatalogItem("Κουτσομούρες", "", 7, 1, []),
      CatalogItem("Τσιπούρα Ψητή", "", 12, 1, []),
    ];
  }
}
