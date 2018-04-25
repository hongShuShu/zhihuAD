//
//  ADModel.h
//  zhihuAD
//
//  Created by xhwl on 2018/4/25.
//  Copyright © 2018年 红蜀黍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADModel : NSObject

@property (nonatomic, copy) NSString *name;

/** 数组里第几个 */
@property (nonatomic, assign) NSInteger index;

+ (NSArray *)getData;

@end
