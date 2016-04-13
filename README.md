# MyCornerRadius
UIImageView的圆角:  

* 产生离屏渲染的maskToBounds

```
    cell.imageOne.layer.cornerRadius = 30.0;
    cell.imageOne.layer.masksToBounds = YES;
```
* 添加maskView

```
    CALayer *maskLayer = [[CALayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, 60, 60);
    maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"appIcon_placeholder"].CGImage);
    cell.imageOne.layer.mask = maskLayer; // iOS 7
    cell.imageTwo.maskView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"appIcon_placeholder"]]; // iOS 8
    cell.imageThree.maskView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"appIcon_placeholder"]];
```
* 生成一张圆角图片

```
- (UIImage *)cornerWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    UIBezierPath  *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CGContextAddPath(contextRef, bezierPath.CGPath);
    CGContextClip(contextRef);
    [image drawInRect:rect];
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}
```
 
参考:  
* [关于性能的一些问题](http://www.reviewcode.cn/article.html?reviewId=7)  
* [JMRoundedCorner](https://github.com/raozhizhen/JMRoundedCorner)  
* [iOS高效添加圆角效果实战讲解](http://www.jianshu.com/p/f970872fdc22)  
* [生产中怎样处理masksToBounds离屏渲染带来的性能损耗](http://ios.jobbole.com/84272/)  
* [iOS图片圆角优化](http://www.olinone.com/?hmsr=toutiao.io&p=484&utm_medium=toutiao.io&utm_source=toutiao.io)  
* [如何优雅地在Storyboard中设置圆角](http://www.jianshu.com/p/055c9982778f)  
* [CornerRadius](https://github.com/Limon-O-O/CornerRadius)  
* [What triggers offscreen rendering, blending and layoutSubviews in iOS?](http://stackoverflow.com/questions/13158796/what-triggers-offscreen-rendering-blending-and-layoutsubviews-in-ios)
