//
//  main.m
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/2/12.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NsPerson.h"
#import "Student.h"
/**
 .h     头文件     写类声明
 ,m    实现文件    写类的实现
 */
/**
分组导航标记

会在导航条对应的位置展示一个标题
#pragma mark 描述信息
会出现一条水平分隔线
#pragma mark -
 
 */
#pragma mark - 方法
void test(void){
    NSLog(@"test==============");
    NSLog(@"test==============");
    NSLog(@"test==============");
}

#pragma mark - main方法
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        NSLog(@"Hello World!");
        //C指针用NULL int *i = NULL; 不指向内存中的空间
        /*OC的类指针使用nil  
        NsPerson *p = nil;   不指向任何对象
        那么这个时候 如果通过p1指针去访问p1指针指向的对象的属性
        这个时候会运行报错，那么这个时候，如果通过p1指针去调用对象的方法 运行不会报错 但是方法不会执行，没有任何反应
         */
        if(NULL == nil){
            NSLog(@"%@ ========= %@" , NULL,nil);
        }
        
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
        NSLog(@"\n");
        NSLog(@"\n");
        NSLog(@"\n");
        
        NsPerson *personA = [NsPerson new];
        personA->_name=@"AAA";
        NsPerson *personB = personA;
        personB->_name = @"BBB";
        NsPerson *personC = personB;
        personC->_name = @"CCC";
        NSLog(@"%@=======%@=========%@" , personA->_name , personB->_name , personC->_name);
        test();
        
        Student *_student = [Student new];
        //对象作为参数的方法 是地址传递，方法中的赋值会影响传入对象的值
        [_student getPersonName:nsPerson];
        NSLog(@"以对象作为参数的方法====%@",nsPerson->_name);
        
        NsPerson *nsPersonQ = [_student getPerson:@"qinyue" :11 :111.12f];
        NSLog(@"以对象作为返回值的方法=====%@=======%d=======%f",nsPersonQ->_name,nsPersonQ->_age,nsPersonQ->_height);
        
        Student* std = [Student new];
        std = [std makeStudent:nsPersonQ :@"qqq" :222 :333.33f ];
        NSLog(@"以对象作为属性==NsPerson===%@====%d====%f=====Student=====%@=====%d=====%f",
              std->_sNsPerson->_name, std->_sNsPerson->_age,std->_sNsPerson->_height
              ,std->_name,std->_age,std->_height);
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        BOOL compareResult = [std compareAge:_student];
        NSLog(@"年龄比较结果===%d",compareResult);
        
        @try {
            NSLog(@"try");
            Student* exceptionStudent = [Student new];
            [exceptionStudent studentException];
        } @catch (NSException *exception) {
            NSLog(@"-------------%@",exception);
        } @finally {
            NSLog(@"@finally");
        }
    
        //类方法调用
        [Student leiFangFa];
        Student *ss = [Student student:@"qinyue":222:22.33f];
        NSLog(@"%@===变量地址：%p====%d======%f",ss->_name,ss->_name,ss->_age,ss->_height);
        
        NSString *ns = @"123";
        NSLog(@"%@",ns);
        //C语言字符串
        char *str0 = "qinyue";
        //C语言字符串转为OC
        NSString *nsstr = [NSString stringWithUTF8String:str0];
        //字符串拼接
        NSString *swf = [NSString stringWithFormat:@"name %@ ,age %d , height %f" , ss->_name , ss->_age,ss->_height];
        NSLog(@"%@",swf);
        //字符串长度
        NSUInteger length = [swf length];
        NSLog(@"=======%lu",length);
        //字符串判断
        BOOL eqResult = [nsstr isEqualToString:swf];
        NSLog(@"=======%d",eqResult);
        
        //匿名对象 没有名字对象，没有用1个指针去存储这个对象的地址
        [[NsPerson new] runInt];
        NsPerson* myPerson = [NsPerson new];
        [myPerson setAge:111];
        [myPerson setName:@"adjakf"];
        [myPerson setHeight:123.55f];
        NSLog(@"get 获取值 -----%@-------%d-------%f",[myPerson getName],[myPerson getAge],[myPerson getHeight]);
        //static 不能修饰熟悉和方法
        //static可以修饰方法中的局部变量．
        //如果方法中的局部变量被static修饰，那么这个变量就会被变成静态变量.
        //存储在常量区当方法执行完毕之后不会回收下次再执行这个方法的时候直接使用而不会再声明了.
        NsPerson* n1 = [NsPerson new];
        [n1 nsPerson:myPerson];
        [n1 staticMethodTest];
        [n1 staticMethodTest];
        [n1 staticMethodTest];
        [n1 staticMethodTest];
        
        [n1 selfMethodTest];
        
        
        
        [ss run];
        [ss runInt];
        
        [ss eat:nsPerson->_name :nsPerson->_height];
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}


