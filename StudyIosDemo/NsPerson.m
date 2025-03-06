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
- (void)setName:(NSString*)name{
    _name = name;
};
- (void)setAge:(int)age{
    _age = age;
};
- (void)setHeight:(float)height{
    _height = height;
};
- (NSString *)getName{
    return _name;
};
- (int)getAge{
    return _age;
};
- (float)getHeight{
    return _height;
};
//无参数方法实现
- (void)run {
    //方法中使用对象属性
    NSLog(@"======= run  ======= %@======%d=======%f",_name,_age,_height);
}
- (int)runInt {
    NSLog(@"======= NsPerson runInt  =======");
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

- (int)staticMethodTest{
    static int a = 111;
    a++;
    NSLog(@"staticMethodTest a = %d",a);
    return a;
};

//如果方法返回值是当前对象 返回值可写为instancetype
- (instancetype) nsPerson:(NsPerson *) n1{
    return n1;
};

- (void) selfMethodTest{
    NSString* _name = @"selfMethodTest";
    self->_name = @"NsPerson - > _name";
    NSLog(@"%@ ========= %@" , _name , self->_name);
    [self runInt];
    [self privateMethodTest];
    
};
//私有方法， 只写实现，不写声明
- (void) privateMethodTest{
    NSString* _name = @"privateMethodTest";
    NSLog(@"%@ ===privateMethodTest======" , _name );
};
//类方法
+ (void)addMethodTest{
    NSLog(@"=======NsPerson addMethodTest  =======");
}
@end
