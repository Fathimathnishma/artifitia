class OnboardingModel {
  // ignore_for_file: public_member_api_docs, sort_constructors_first
  String title;
  String description;
  String image;

  OnboardingModel(
      {required this.title,
      required this.description,
      required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{

      'title': title,
      'description': description,
      'image': image,
    };
  }

  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
 
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }
}
