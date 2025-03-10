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
    // 错误使用self.name  相当于 [NsPerson setName] 形成递归 死循环 使程序崩溃
    //self.name = name;
};
- (void)setAge:(int)age{
    _age = age;
};
- (void)setHeight:(float)height{
    _height = height;
};
- (NSString *)name{
    return _name;
};
- (int)age{
    return _age;
};
- (float)height{
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
- (NSNumber *)oneJoinMethod:(NSNumber *) addA{
    NSLog(@"一个入参的方法---%@ ",addA );
    return addA;
}

- (NSString *)twoJoinMethod:(NSString *) addA
                           :(NSString *) addB{
    NSLog(@"两个入参的方法---%@---%@ ",addA,addB );
    return @"twoJoinMethod";
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
