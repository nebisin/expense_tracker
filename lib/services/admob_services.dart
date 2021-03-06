/*
import 'package:firebase_admob/firebase_admob.dart';

class AdmobService {
  static final AdmobService _instance = AdmobService._internal();
  factory AdmobService() => _instance;
  MobileAdTargetingInfo _targetingInfo;
  final String _bannerAdId = 'ca-app-pub-1639338975133942/7369380052';
  final String _interAdId = 'ca-app-pub-1639338975133942/3430135044';

  AdmobService._internal() {
    _targetingInfo = MobileAdTargetingInfo();
  }

  BannerAd _bannerAd;

  BannerAd _createBannerAd() {
    return BannerAd(
      adUnitId: _bannerAdId,
      size: AdSize.smartBanner,
      targetingInfo: MobileAdTargetingInfo(),
    );
  }

  void showBannerAd() {
    _bannerAd = _createBannerAd();
    _bannerAd
      ..load()
      ..show();
  }

  void hideBannerAd() {
    _bannerAd?.dispose();
  }

  showIntersitial() {
    InterstitialAd interstitialAd = InterstitialAd(
      adUnitId: _interAdId,
      targetingInfo: _targetingInfo,
    );

    interstitialAd
      ..load()
      ..show();

    interstitialAd.dispose();
  }

}
*/