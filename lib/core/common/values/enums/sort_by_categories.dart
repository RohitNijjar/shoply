enum SortByCategories {
  categoryNameAsc('Category Name A - Z'),
  categortNameDesc('Category Name Z - A'),
  categoryPriceAsc('Category Price Low - High'),
  categoryPriceDesc('Category Price High - Low');

  final String value;
  const SortByCategories(this.value);
}
