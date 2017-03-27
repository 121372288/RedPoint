//
//  UIView+MMRedPoint.h
//  MMSou
//
//  Created by 马磊 on 2016/12/1.
//  Copyright © 2016年 beileyun. All rights reserved.
//

#import <UIKit/UIKit.h>

// 小红点的宽高
#define MLRedPointWH 8

@interface UIView (MLRedPoint)

@property (nonatomic, copy) NSString *mlBadgeValue;

@property (nonatomic, strong) UIView *mlRedPointView;

- (CGPoint )setRedPointFrame;

@end
