//
//  Student.h
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/2/13.
//
#import <Foundation/Foundation.h>
#import "NsPerson.h"
#import "Book.h"
#import "Pen.h"
#ifndef Student_h
#define Student_h
#endif /* Student_h */

#pragma mark - Student声明
//新建类
//使用Book协议
@interface Student : NsPerson<Book,Pen>{

}

#pragma mark - Student方法声明

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

-(void)studentException;
#pragma mark - 类方法
+(void)leiFangFa;

+(Student *) student:(NSString *)_name
                    :(int)_age
                    :(float)_height;
//单例命名规范
+(instancetype) shareStudent;
+(instancetype) defaultStudent;
@end

