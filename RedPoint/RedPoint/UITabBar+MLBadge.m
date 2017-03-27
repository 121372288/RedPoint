//
//  UITabBar+MMBadge.m
//  MMSou
//
//  Created by 马磊 on 2016/12/2.
//  Copyright © 2016年 beileyun. All rights reserved.
//

#import "UITabBar+MLBadge.h"

@implementation UITabBar (MLBadge)

- (void)showBadgeOnItemIndex:(int)index{
    
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    badgeView.clipsToBounds = YES;
    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
    float percentX = (index + 0.58) / self.items.count;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 10, 10);//圆形大小为MMRedPointWH
    [self addSubview:badgeView];
    
}//显示小红点


//隐藏小红点
- (void)hideBadgeOnItemIndex:(int)index{
    //移除小红点
    [self removeBadgeOnItemIndex:index];
}

//移除小红点
- (void)removeBadgeOnItemIndex:(int)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}

@end
