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
//有参数方法
- (void)eat:(NSString *)food
           :(int)sum{
    NSLog(@"Student  eat   start %@ ======= %d",food , sum);
    //执行当前类方法
    [self runInt];
    //执行父类方法
    [super runInt];
    NSLog(@"Student  eat   end %@ ======= %d",food , sum);
}
- (int)runInt {
    NSLog(@"======= Student runInt  =======");
    return 111;
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
-(void)studentException{
    
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

- (BOOL)compareAge:(Student *)_student{
    return _age>_student->_age;
}
#pragma mark - 类方法
+ (void)leiFangFa{
    NSLog(@"leiFangFa 类方法");
}

+(Student *) student:(NSString *)_name
                    :(int)_age
                    :(float)_height{
    Student *s1 = [Student new];
    s1->_name = _name;
    s1->_age = _age;
    s1->_height = _height;
    return s1;
}
@end
