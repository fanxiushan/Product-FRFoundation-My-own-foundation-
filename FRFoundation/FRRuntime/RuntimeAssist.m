//
//  RuntimeAssist.m
//  Fan
//
//  Created by xiushanfan on 30/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "RuntimeAssist.h"
#import <objc/objc-runtime.h>

@interface RuntimeAssist () {
    
}


@end

@implementation RuntimeAssist

+ (NSArray *)ivarsOfClass:(NSString *)className {
    unsigned int ivarsOutCount = 0;
    Class class =  NSClassFromString(className);
    Ivar *ivars = class_copyIvarList(class, &ivarsOutCount);
    NSMutableArray *ivarArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < ivarsOutCount; i++) {
        Ivar ivar = ivars[i];
        const char *ivarName = ivar_getName(ivar);
        [ivarArray addObject:[NSString stringWithCString:ivarName encoding:NSUTF8StringEncoding]];
    }
    return ivarArray;
}

+ (NSArray *)propertiesOfClass:(NSString *)className {
    unsigned int propertyOutCount = 0;
    Class class =  NSClassFromString(className);
    objc_property_t *objProT = class_copyPropertyList(class, &propertyOutCount);
    NSMutableArray *propertyNameArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < propertyOutCount; i++) {
        objc_property_t property = objProT[i];
        const char *propertyName = property_getName(property);
        [propertyNameArray addObject:[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
    }
    return propertyNameArray;
}

+ (NSArray *)methodsOfClass:(NSString *)className {
    unsigned int methodCount= 0;
    Class class = NSClassFromString(className);
    Method *methods = class_copyMethodList(class, &methodCount);
    NSMutableArray *methodArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < methodCount; i++) {
        Method method = methods[i];
        SEL methodName = method_getName(method);
        [methodArray addObject:[NSString stringWithCString:sel_getName(methodName) encoding:NSUTF8StringEncoding]];
    } 
    return methodArray;
}



@end
