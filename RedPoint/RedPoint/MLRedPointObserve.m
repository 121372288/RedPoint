//
//  MLRedPointObserve.m
//  RedPoint
//
//  Created by 马磊 on 2017/3/27.
//  Copyright © 2017年 MLCode.com. All rights reserved.
//

#import "MLRedPointObserve.h"
#import <UIKit/UIKit.h>
#import "UIView+MLRedPoint.h"

@implementation MLRedPointObserve

+ (instancetype)initialRedPoint {
    static MLRedPointObserve *handle =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handle =[[MLRedPointObserve alloc]init];
    });
    return handle;
}

// 监听UIView视图frame的变化来改变红点的位置
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString: @"frame"]) {
        UIView *view = (UIView *)object;
        // 设置位置
//        NSLog(@"%@, %@",NSStringFromCGRect(view.frame),NSStringFromCGPoint([view setRedPointFrame]));
        view.mlRedPointView.frame = CGRectMake([view setRedPointFrame].x, [view setRedPointFrame].y, MLRedPointWH, MLRedPointWH) ;
        [view bringSubviewToFront:view.mlRedPointView];
    }
}


@end
