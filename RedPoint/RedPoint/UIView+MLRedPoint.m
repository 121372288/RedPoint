//
//  UIView+MMRedPoint.m
//  MMSou
//
//  Created by 马磊 on 2016/12/1.
//  Copyright © 2016年 beileyun. All rights reserved.
//

#import "UIView+MLRedPoint.h"
#import <objc/runtime.h>
#import "UIView+Extension.h"
#import "MLRedPointObserve.h"

@implementation UIView (MLRedPoint)

#pragma mark -红点视图
static const char MLRedPointViewKey = '\0';
- (void)setMlRedPointView:(UIView *)mlRedPointView {
    
    [self.mlRedPointView removeFromSuperview];
    [self addSubview:mlRedPointView];
    //确定红点位置
    mlRedPointView.origin = [self setRedPointFrame];
    objc_setAssociatedObject(self, &MLRedPointViewKey,mlRedPointView, OBJC_ASSOCIATION_ASSIGN);
    
}

- (UIView *)mlRedPointView {
    return objc_getAssociatedObject(self, &MLRedPointViewKey);
}

#pragma mark -红点设置值
static const char MLBadgeValue = '\0';
- (void)setMlBadgeValue:(NSString *)mlBadgeValue {
    if (mlBadgeValue != self.mlBadgeValue) {
        objc_setAssociatedObject(self, &MLBadgeValue, mlBadgeValue, OBJC_ASSOCIATION_ASSIGN);
    }
    // mmBadgeValue 来设置
    if (!self.mlRedPointView) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor redColor];
        imageView.size = CGSizeMake(MLRedPointWH, MLRedPointWH);
        imageView.layer.cornerRadius = MLRedPointWH/2;
        imageView.clipsToBounds = YES;
        // 添加监听  为了让添加的红点一直保持在俯视图最上面
//        self.subviews
        [self addObserver:[MLRedPointObserve initialRedPoint] forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
        self.mlRedPointView = imageView;
        
    }
    
    if (!mlBadgeValue) {
        self.mlRedPointView.hidden = true;
        
    } else if ([mlBadgeValue isEqualToString:@"0"] || [mlBadgeValue isEqualToString:@""]) {
        self.mlRedPointView.hidden = false;
    } else {// 有数字
        self.mlRedPointView.hidden = false;
        // 并在此设置数值
    }
}



- (NSString *)mlBadgeValue {
    return objc_getAssociatedObject(self, &MLBadgeValue);
}

- (CGPoint )setRedPointFrame {
    CGFloat x = ceilf(0.8 * self.width);
    CGFloat y = ceilf(0.1 * self.size.height);
    return CGPointMake(x, y);
}


- (void)dealloc {
    // 销毁时移除自身引用观察
    [self removeObserver:[MLRedPointObserve initialRedPoint] forKeyPath:@"frame"];
}

@end
