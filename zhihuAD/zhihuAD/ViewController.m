//
//  ViewController.m
//  zhihuAD
//
//  Created by xhwl on 2018/4/25.
//  Copyright © 2018年 红蜀黍. All rights reserved.
//

#import "ViewController.h"
#import "ADViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ADViewController *vc = [[ADViewController alloc] init];
    vc.title = @"AD";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
