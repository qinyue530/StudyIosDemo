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
}

#pragma mark - NsPerson方法声明
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
@end

