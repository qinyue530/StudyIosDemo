//
//  main.m
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/2/12.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//新建类
@interface NsPerson : NSObject{
    @public
    NSString *_name;
    int _age;
    float _height;
}

//无参数方法
- (void)run ;
- (int)runInt ;
//有参数方法
- (void)eat:(NSString *)food
           :(int)sum;
- (int)sumWith:(int) addA
              :(int) addB;
@end
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

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        NSLog(@"Hello World!");
        NsPerson *nsPerson = [NsPerson new];
        nsPerson->_name = @"qinyue";
        nsPerson->_height = 12.2f;
        NSLog(@"===========%@ ======== %f" , nsPerson->_name , nsPerson->_height);
        (*nsPerson)._name = @"qinyue";
        (*nsPerson)._height = 111.11f;
        NSLog(@"===========%@ ======== %f" , nsPerson->_name , nsPerson->_height);
        
        NSLog(@"\n");
        NSLog(@"\n");
        NSLog(@"\n");
        //方法调用
        [nsPerson run];
        int result = [nsPerson runInt];
        NSLog(@"nsPerson runInt 结果=== %d", result);
        NSLog(@"\n");
        NSLog(@"\n");
        NSLog(@"\n");
        [nsPerson eat:nsPerson->_name :nsPerson->_height];
        NSString *eatResult = [nsPerson eatNSString:nsPerson->_name :nsPerson->_height];
        NSLog(@"%@" , eatResult);
        [nsPerson sumWith:5 :7];
        
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}


