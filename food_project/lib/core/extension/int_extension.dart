import '../../ui/shared/size_fit.dart';

extension IntFit on int {
  double get px {
    return ZCSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return ZCSizeFit.setRpx(this.toDouble());
  }

}