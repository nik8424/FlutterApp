class Category {
  final String name;

  final String image;

  Category(
    this.name,
    this.image,
  );
}

List<Category> categories = categoriesData
    .map((item) => Category(
        item['name']?.toString() ?? '', item['image']?.toString() ?? ''))
    .toList();

var categoriesData = [
  {"name": "ETRX", 'courses': 17, 'image': "assets/images/marketing.png"},
  {"name": "IT ", 'courses': 25, 'image': "assets/images/ux_design.png"},
  {"name": "COMPS", 'courses': 13, 'image': "assets/images/photography.png"},
  {"name": "MECH", 'courses': 17, 'image': "assets/images/business.png"},
];
