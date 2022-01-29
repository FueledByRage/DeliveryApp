class Restaurant {
  final String name;
  final String street;
  final String logoUrl;
  final String imageUrl;
  final String category;
  int score = 0;

  Restaurant(
      {required this.name,
      required this.street,
      this.logoUrl = '',
      this.imageUrl = '',
      this.category = ''});
}
