class CategoryDm {
  String id;

  String nameEn;
  String nameAr;
  String imageLightPath;
  String imageDarkPath;
  bool isRTL;

  CategoryDm(
    this.id,
    this.nameEn,
    this.nameAr,
    this.imageLightPath,
    this.imageDarkPath,
    this.isRTL,
  );
}

List<CategoryDm> categories = [
  CategoryDm(
    'general',
    'General',
    'عام',
    'assets/images/general.png',
    'assets/images/general_dark.png',
    false,
  ),
  CategoryDm(
    'business',
    'Business',
    'أعمال',
    'assets/images/busniess.png',
    'assets/images/busniess_dark.png',
    true,
  ),
  CategoryDm(
    'sport',
    'Sports',
    'رياضة',
    'assets/images/sport.png',
    'assets/images/sport_dark.png',
    false,
  ),
  CategoryDm(
    'health',
    'Health',
    'صحة',
    'assets/images/helth.png',
    // Note: Corrected the typo in the file name from 'helth' if necessary, but using the filename as provided in the image.
    'assets/images/helth_dark.png',
    true,
  ),
  CategoryDm(
    'entertainment',
    'Entertainment',
    'تسلية',
    'assets/images/entertainment.png',
    'assets/images/entertainment_dark.png',
    false, // or true if you want to set the entire category to RTL
  ),
  CategoryDm(
    'technology',
    'Technology',
    'تكنولوجيا',
    'assets/images/technology.png',
    'assets/images/technology_dark.png',
    true,
  ),

  CategoryDm(
    'science',
    'Science',
    'علوم',
    'assets/images/science.png',
    'assets/images/science_dark.png',
    false,
  ),
];
