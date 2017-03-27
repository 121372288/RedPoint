//
//  ViewController.m
//  RedPoint
//
//  Created by 马磊 on 2017/3/27.
//  Copyright © 2017年 MLCode.com. All rights reserved.
//

#import "ViewController.h"

#import "RedPoint.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *redView;

@end

@implementation ViewController

- (UIView *)redView {
    if (_redView == nil) {
        UIView *redView = [[UIView alloc] init];
        redView.frame = CGRectMake(100, 100, 100, 100);
        redView.backgroundColor = [UIColor blueColor];
        _redView = redView;
    }
    return _redView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.redView];
    
    self.redView.mlBadgeValue = @"";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.redView.mlBadgeValue) {
        self.redView.mlBadgeValue = nil;
    } else {
        self.redView.mlBadgeValue = @"";
    }
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    view.frame = CGRectMake(20, 25, 7, 18);
    [self.redView addSubview:view];
//    self.redView.frame = CGRectMake(20, 20, 200, 160);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
