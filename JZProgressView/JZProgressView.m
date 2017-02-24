//
//  JZProgressView.m
//  JZProgressView
//
//  Created by wanhongios on 17/2/23.
//  Copyright © 2017年 wanhongios. All rights reserved.
//

#import "JZProgressView.h"

@implementation JZProgressView{
    CAShapeLayer *backGroundLayer; //背景图层
    CAShapeLayer *frontFillLayer;      //用来填充的图层
    UIBezierPath *backGroundBezierPath; //背景贝赛尔曲线
    UIBezierPath *frontFillBezierPath;  //用来填充的贝赛尔曲线
}
@synthesize progressColor = _progressColor;
@synthesize progressTrackColor = _progressTrackColor;
@synthesize progressValue = _progressValue;
@synthesize progressStrokeWidth = _progressStrokeWidth;
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setUp];
        
    }
    return self;
    
}
/**
 *  初始化创建图层
 */
- (void)setUp
{
    //创建背景图层
    backGroundLayer = [CAShapeLayer layer];
    backGroundLayer.fillColor = nil;
    
    
    //创建填充图层
    frontFillLayer = [CAShapeLayer layer];
    frontFillLayer.fillColor = nil;
    
    

    [self.layer addSublayer:backGroundLayer];
    [self.layer addSublayer:frontFillLayer];
    
    self.centerView = nil;

}

-(void)setCenterView:(UIView *)centerView{
    if (_centerView != centerView) {
        [_centerView removeFromSuperview];
        _centerView = centerView;
        [self addSubview:self.centerView];
    }
}

- (void)setProgressColor:(UIColor *)progressColor
{
    _progressColor = progressColor;
    frontFillLayer.strokeColor = progressColor.CGColor;
}
- (UIColor *)progressColor
{
    return _progressColor;
}
- (void)setProgressTrackColor:(UIColor *)progressTrackColor
{
    _progressTrackColor = progressTrackColor;
    backGroundLayer.strokeColor = progressTrackColor.CGColor;
    backGroundBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)) radius:(CGRectGetWidth(self.bounds)-self.progressStrokeWidth)/2.f startAngle:0 endAngle:M_PI*2
                                                       clockwise:YES];
    backGroundLayer.path = backGroundBezierPath.CGPath;
}
- (UIColor *)progressTrackColor
{
    return _progressTrackColor;
}
- (void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;
    frontFillBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)) radius:(CGRectGetWidth(self.bounds)-self.progressStrokeWidth)/2.f startAngle:-M_PI_2 endAngle:(2*M_PI)*progressValue-M_PI_2 clockwise:YES];
    frontFillLayer.path = frontFillBezierPath.CGPath;
}
- (CGFloat)progressValue
{
    return _progressValue;
}
- (void)setProgressStrokeWidth:(CGFloat)progressStrokeWidth
{
    _progressStrokeWidth = progressStrokeWidth;
    frontFillLayer.lineWidth = progressStrokeWidth;
    backGroundLayer.lineWidth = progressStrokeWidth;
}
- (CGFloat)progressStrokeWidth
{
    return _progressStrokeWidth;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    backGroundLayer.frame = self.bounds;
    frontFillLayer.frame = self.bounds;
    self.centerView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

@end
