//
//  RuntimeAssist.h
//  Fan
//
//  Created by xiushanfan on 30/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RuntimeAssist : NSObject

/*
 *  @func:获取指定类的成员变量
 *
 *  @param:className 指定类的类名
 *
 *  @return:类成员变量名字数组.
 */
+ (NSArray *)ivarsOfClass:(NSString *)className;

/*
 *  @func:获取指定类的属性
 *
 *  @param:className 指定类的类名
 *
 *  @return:类的属性列表
 */
+ (NSArray *)propertiesOfClass:(NSString *)className;


/*
 *  @func:获取指定类的方法
 *
 *  @param:className 指定类的类名
 *
 *  @return:类的方法列表
 */
+ (NSArray *)methodsOfClass:(NSString *)className;



@end
