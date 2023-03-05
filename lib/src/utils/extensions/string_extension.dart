extension XString on String? {
  bool get isNumeric {
    if (this == null) {
      return false;
    }
    return num.tryParse(this!) != null;
  }
}
