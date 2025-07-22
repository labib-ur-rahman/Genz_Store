import 'package:genz_store/routes/routes.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onBoarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_reviews/product_reviews.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: SLRoutes.home, page: () => const HomeScreen()),
    GetPage(name: SLRoutes.store, page: () => const StoreScreen()),
    GetPage(name: SLRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: SLRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: SLRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: SLRoutes.order, page: () => const OrderScreen()),
    GetPage(name: SLRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: SLRoutes.cart, page: () => const CartScreen()),
    GetPage(name: SLRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: SLRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: SLRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: SLRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: SLRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: SLRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: SLRoutes.onBoarding, page: () => const OnBoardingScreen()),

  ];
}
