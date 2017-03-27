//
//  UITabBar+MMBadge.h
//  MMSou
//
//  Created by 马磊 on 2016/12/2.
//  Copyright © 2016年 beileyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (MLBadge)

- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点

@end
