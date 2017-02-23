//
//  JZProgressView.h
//  JZProgressView
//
//  Created by wanhongios on 17/2/23.
//  Copyright © 2017年 wanhongios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZProgressView : UIView
/**
 *  进度值0-1.0之间
 */
@property (nonatomic,assign)CGFloat progressValue;

/**
 *  边宽
 */
@property(nonatomic,assign) CGFloat progressStrokeWidth;

/**
 *  进度条颜色
 */
@property(nonatomic,strong)UIColor *progressColor;

/**
 *  进度条轨道颜色
 */
@property(nonatomic,strong)UIColor *progressTrackColor;

/** * centerView */
@property(nonatomic,weak)UIView * centerView;
@end
