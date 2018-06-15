//
//  FLHCommonItem.h
//  FLHSlideMenuDemo
//
//  Created by mac on 2018/6/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FLHCommonItemOption)();

@interface FLHCommonItem : NSObject

/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  子标题
 */
@property (nonatomic, copy) NSString *subtitle;
/**
 *  点击那个cell需要做什么事情
 */
@property (nonatomic, copy) FLHCommonItemOption myBlock;

/**
 *  点击这行cell需要跳转的控制器
 */
@property (nonatomic, assign) Class destVcClass;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subtitle:(NSString *)subtitle destVcClass:(Class)destVcClass;

@end
