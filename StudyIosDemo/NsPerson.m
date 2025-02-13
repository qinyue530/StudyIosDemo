//
//  NsPerson.m
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/2/13.
//

#import <Foundation/Foundation.h>
#import "NsPerson.h"
#pragma mark - NsPerson方法实现
//方法
@implementation NsPerson
//无参数方法实现
- (void)run {
    //方法中使用对象属性
    NSLog(@"======= run  ======= %@======%d=======%f",_name,_age,_height);
}
- (int)runInt {
    NSLog(@"======= runInt  =======");
    return 111;
}
//有参数方法
- (void)eat:(NSString *)food
           :(int)sum{
    NSLog(@"%@ ======= %d",food , sum);
}

- (NSString *)eatNSString:(NSString *)food
           :(int)sum{
    NSLog(@"%@ ======= %d",food , sum);
    return @"eatNSString";
}

-(int)sumWith:(int)addA
             :(int)addB{
    NSLog(@"%d + %d = %d",addA , addB,addA + addB);
    return addA+addB;
}
@end
