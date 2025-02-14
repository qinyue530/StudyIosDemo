//
//  Student.m
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/2/13.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#pragma mark - NsPerson方法实现
//方法
@implementation Student
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

- (int)getPersonName:(NsPerson *)nsPerson{
    NSLog(@"getPersonName========%@" , nsPerson->_name);
    nsPerson->_name = @"大黄";
    return 111l;
}

- (NsPerson *)getPerson:(NSString *)_name
                       :(int)_age
                       :(float)_height{
    NsPerson* nsPerson = [NsPerson new];
    nsPerson->_name = _name;
    nsPerson->_age = _age;
    nsPerson->_height = _height;
    return nsPerson;
}

- (Student *)makeStudent:(NsPerson *)_nsPerson
                  :(NSString *)_name
                  :(int)_age
                  :(float)_height{
    Student* myStudent = [Student new];
    myStudent->_age=_age;
    myStudent->_name=_name;
    myStudent->_height=_height;
    myStudent->_sNsPerson = _nsPerson;
    return myStudent;
}
@end
