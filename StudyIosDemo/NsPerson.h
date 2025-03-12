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
@interface NsPerson : NSObject

//{
//    //不允许在声明的时候初始化赋值
//    @public
//    NSString *_name;
//    NSString *_idno;
//    NSString *_sex;
//    int _age;
//    float _height;
//    NsPerson *_sNsPerson;
//}

#pragma mark - NsPerson方法声明
//@property 自动生成get 和set 方法 ， 仅生成声明，实现还要写
//- (NSString *)name;
//- (void)setName:(NSString*)name;

@property NSString *name,*idno,*sex;
@property int age;
@property float height;
//atomic 默认值，如果写atomic，这个时候生成的setter方法的代码就会被加上一把线程安全锁。特点：安全、效率低下
//nonatomic 如果写nonatomic 这个时候生成的setter方法的代码就不会加线程安全锁.特点：不安全，但是效率高
//建议：要效率，选择使用nonatomic 在没有讲解多线程的知识以前 統统使用nonatomic

//assign 默认值 生成的setter方法的实现就是直接赋值.
//retain 生成的setter方法的实现就是标准的MRC内存管理代码.也就是，先判断新旧对象是否为同1个对象 如果不是 release旧的retain新的.
//当属性的类型是OC对象类型的时候，那么就使用retain 当属性的类型是非OC对象的时候，使用assign.

//readwrite 默认值.代表同时生成getter setter
//readonly 只会生成getter 不会生成setter

//默认情况下 @property生成的getter setter 方法的名字都是最标准的名字 其实我们可以通过参数来指定 @property 生成的方法的名字，
//getter = getter方法名字 用来指定 @property生成的getter方法的名字，
//setter = setter方法名字.用来指定 @property生成的setter方法的名字.注意.setter方法是带参数的 所以要加1个冒号.
//记住：如果使用getter setter修改了生成的方法的名字，在使用点语法的时候。编译器会转换为调用修改后的名字的代码
//修改生成的getter setter方法名字。因为默认情况下生成的方法的名字已经是最标准的名字了.所以。一般情况下不要去改。
//1）. 无论什么情况都不要改setter方法的名字，因为默认情况下生成的名字就已经是最标准的了.
//2）. 什么时候修改getter方法的名字。当属性的类型是1个B00L类型的时候。就修改这个g9ter的名字以1s开头 提高代码的阅读型

//默认为atomic
@property(atomic,assign,readwrite,getter=getSnsPerson,setter=snsPerson:) NsPerson *sNsPerson;
//- (void)setAge:(int)age;
//- (void)setHeight:(float)height;
//- (int)age;
//- (float)height;

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

+ (instancetype)nsPerson;
+ (id)idNsPerson;

- (instancetype) init;
//自定义构造方法 只有 initWithXXX 会识别为构造方法 注意大小写
- (instancetype) initWithAll:(NSString *)name
                            :(int)age
                            :(float)height;

- (void)dealloc;
@end

