//
//  ADModel.m
//  zhihuAD
//
//  Created by xhwl on 2018/4/25.
//  Copyright © 2018年 红蜀黍. All rights reserved.
//

#import "ADModel.h"

@implementation ADModel

+ (NSArray *)getData {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    for (int i =0; i<30;i++) {
        ADModel *model = [[ADModel alloc] init];
        model.name = [NSString stringWithFormat:@"%d",i];
        if (i == 3) {
            model.name = @"AD";
        }
        
        [array addObject:model];
    }
    
    return array;
}

@end
