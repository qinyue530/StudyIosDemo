//
//  Student.h
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/2/13.
//
#import <Foundation/Foundation.h>
#import "NsPerson.h"
#ifndef Student_h
#define Student_h
#endif /* Student_h */

#pragma mark - Student声明
//新建类
@interface Student : NSObject{
    //不允许在声明的时候初始化赋值
    @public
    NSString *_name;
    int _age;
    float _height;
    NsPerson *_sNsPerson;
}

#pragma mark - Student方法声明
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

- (int)getPersonName:(NsPerson *)nsPerson;

- (NsPerson *)getPerson:(NSString *)_name
                       :(int)_age
                       :(float)_height;

- (Student *)makeStudent:(NsPerson *)_nsPerson
                  :(NSString *)_name
                  :(int)_age
                  :(float)_height;

- (BOOL)compareAge:(Student *)_student;
@end

