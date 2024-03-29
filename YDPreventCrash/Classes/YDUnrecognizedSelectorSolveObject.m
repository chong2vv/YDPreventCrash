//
//  YDUnrecognizedSelectorSolveObject.m
//  YDKitDemo
//
//  Created by wangyuandong on 2021/9/15.
//

#import "YDUnrecognizedSelectorSolveObject.h"
#import <objc/runtime.h>

@interface YDUnrecognizedSelectorSolveObject ()


@end

@implementation YDUnrecognizedSelectorSolveObject

+ (instancetype) sharedInstance{
    static YDUnrecognizedSelectorSolveObject *unrecognizedSelectorSolveObject;
    static dispatch_once_t  once_token;
    dispatch_once(&once_token, ^{
        unrecognizedSelectorSolveObject = [[YDUnrecognizedSelectorSolveObject alloc] init];
    });
    return unrecognizedSelectorSolveObject;
}

+ (BOOL) resolveInstanceMethod:(SEL)selector {
    
    //向类中动态的添加方法，第三个参数为函数指针，指向待添加的方法。最后一个参数表示待添加方法的“类型编码”
    return class_addMethod([self class], selector,(IMP)autoAddMethod,"v@:@");
}


+ (NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate *datenow = [NSDate date];
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    return currentTimeString;
    
}

id autoAddMethod(id self, SEL _cmd) {
    NSLog(@"%@ __ %@ ",self,NSStringFromSelector(_cmd));
    return nil;
}

@end
