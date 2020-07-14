import '../../ui/shared/size_fit.dart';

extension DoubleFit on double {
  double get px {
    return ZCSizeFit.setPx(this);
  }

  double get rpx {
    return ZCSizeFit.setRpx(this);
  }
}