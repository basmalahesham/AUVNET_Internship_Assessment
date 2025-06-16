class OnboardingPageModel {
  final String title;
  final String subtitle;

  OnboardingPageModel({required this.title, required this.subtitle});
}

final onboardingPages = [
  OnboardingPageModel(
    title: 'all-in-one delivery',
    subtitle: 'Order groceries, medicines, and meals delivered straight to your door',
  ),
  OnboardingPageModel(
    title: 'User-to-User Delivery',
    subtitle: 'Send or receive items from other users quickly and easily',
  ),
  OnboardingPageModel(
    title: 'Sales & Discounts',
    subtitle: 'Discover exclusive sales and deals every day',
  ),
];
