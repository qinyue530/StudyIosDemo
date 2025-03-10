//
//  NsPerson.h
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/2/13.
//
#import <Foundation/Foundation.h>
#ifndef NsPerson_h
#define NsPerson_h
#endif /* NsPerson_h */

#pragma mark - NsPerson声明
//新建类
@interface NsPerson : NSObject{
    //不允许在声明的时候初始化赋值
    @public
    NSString *_name;
    int _age;
    float _height;
    NsPerson *_sNsPerson;
}

#pragma mark - NsPerson方法声明
//@property 自动生成get 和set 方法 ， 仅生成声明，实现还要写
//- (NSString *)name;
//- (void)setName:(NSString*)name;
@property NSString *name;
- (void)setAge:(int)age;
- (void)setHeight:(float)height;
- (int)age;
- (float)height;

//无参数方法
- (void)run ;
- (int)runInt ;
//有参数方法
- (void)eat:(NSString *)food
           :(int)sum;
- (NSString *)eatNSString:(NSString *)food
                         :(int)sum;
- (int)sumWith:(int) addA
              :(int) addB;
- (NSNumber *)oneJoinMethod:(NSNumber *) addA;
- (NSString *)twoJoinMethod:(NSString *) addA
                           :(NSString *) addB;
- (int)staticMethodTest;

- (instancetype) nsPerson:(NsPerson *) n1;

- (void) selfMethodTest;
//类方法
+ (void)addMethodTest;
@end

