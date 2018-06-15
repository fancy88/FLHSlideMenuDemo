//
//  FLHCommonItem.m
//  FLHSlideMenuDemo
//
//  Created by mac on 2018/6/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FLHCommonItem.h"

@implementation FLHCommonItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subtitle:(NSString *)subtitle destVcClass:(Class)destVcClass{
    FLHCommonItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.subtitle = subtitle;
    item.destVcClass = destVcClass;
    return item;
}

@end
