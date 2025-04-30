//
//  ViewController.m
//  StudyIosDemo
//
//  Created by 秦跃 on 20210/2/12.
//

#import "ViewController.h"
#import "TomCatController.h"
#import "XibViewController.h"
#import "JsYdViewController.h"
//获取屏幕高度
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
//获取屏幕宽度
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
//UIView 常用基本属性
//frame
//frame 相对于父视图 坐标、bounds 相对于视图本身的坐标、alpha 透明度、hidden 隐藏、bankgroundColor 背景颜色、tag 整数
//superView 获取当前视图的父视图
//subViews 获取当前视图的所有子视图

//子视图管理
//添加子视图 addSubview
//移除子视图 removeFromSuperview
//查找子视图 viewWithTag
//移动
//交换

//类扩展
@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UITextField *number1;
//@property (weak, nonatomic) IBOutlet UITextField *number2;
//@property (weak, nonatomic) IBOutlet UILabel *lblResult;
//@property (weak, nonatomic) IBOutlet UIButton *pingyi;
//@property (weak, nonatomic) IBOutlet UIButton *xuanzhuan;
//@property (weak, nonatomic) IBOutlet UIButton *suofang;
//@property (weak, nonatomic) IBOutlet UIButton *fuwei;
//@property (weak, nonatomic) IBOutlet UITextField *password;
//@property (weak, nonatomic) IBOutlet UIButton *jisuan;
//@property (weak, nonatomic) IBOutlet UIButton *qingping;
//使用strong可以展示，使用weak 无法展示（没有强引用，会立即失效）
@property (nonatomic, strong) UILabel *timeLable;
@property (weak, nonatomic) NSTimer *timer;
//Text Field中
//Secure Text Entry点上对勾，可以隐藏密码
//Placeholder 输入框提示信息
//clear Button 改为 is always visible 输入框最后有个叉按钮点击会清空
//- (IBAction)shangyi:(id)sender;
//- (IBAction)youyi:(id)sender;
//- (IBAction)zuoyi:(id)sender;
//- (IBAction)xiayi:(id)sender;
//- (IBAction)fangda:(id)sender;
//- (IBAction)suoxiao:(id)sender;
//- (IBAction) jisuan:(id)sender;
//- (IBAction)pingyi:(id)sender;
//- (IBAction)xuanzhuan:(id)sender;
//- (IBAction)suofang:(id)sender;
//- (IBAction)fuwei:(id)sender;
//- (IBAction)qingping:(id)sender;

@property (nonatomic,strong) NSArray *pic;
@property (nonatomic,assign) int index;

@end

@implementation ViewController

-(NSArray *)pic{
    if(_pic == nil){
        //获取Info.plist中数据
        //获取手机安装软件的跟路径，在这个路径，搜索Info.plist文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _pic = array;
    }
    return _pic;
}

- (void) timerAction{
    static NSInteger i = 0;
    NSLog(@"i = %ld",i++);
    if(i == 30){
        //停止
        [self.timer setFireDate:[NSDate distantFuture]];
    }else{
        //开启
        [self.timer setFireDate:[NSDate distantPast]];
    }
    sleep(1);
    [self.timeLable setText:[NSString stringWithFormat:@"计时器 - %ld",i]];
    [self.timeLable setTextColor:[UIColor blackColor]];
    [self.view addSubview:self.timeLable];
}

//当要显示一个界面的时候，首先创建这个界面对应的控制器控制器创建好以后，接着创建控制器所管理的那个view，当这个view加载完毕以后就开始执行下面的方法了。
//所以只要viewDidLoad方法被执行了，就表示控制器所管理的view创建好了
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    // Do any additional setup after loading the view.
    //动态创建一个按钮
    UIButton *btn = [[UIButton alloc] init];
//    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
//    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    //普通状态 按钮内容
    [btn setTitle:@"aaa" forState:UIControlStateNormal];
    //点击状态 按钮内容
    [btn setTitle:@"bbb" forState:UIControlStateHighlighted];
    //设置文字颜色
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    //加载图片
    UIImage *imgNormal = [UIImage imageNamed:@"A"];
    UIImage *imgHighlighted = [UIImage imageNamed:@"B"];
    //普通状态 按钮背景图
    [btn setBackgroundImage:imgNormal forState:UIControlStateNormal];
    //点击状态 按钮背景图
    [btn setBackgroundImage:imgHighlighted forState:UIControlStateHighlighted];
    //设置坐标和大小
    btn.frame = CGRectMake(0, 55, 55, 55);
    //按钮增加一个单击事件
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    //增加控件
    [self.view addSubview:btn];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页"; // 设置导航栏标题
        
    // 创建跳转按钮
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeSystem];
    pushButton.frame = CGRectMake(0, 300, 200, 50);
    [pushButton setTitle:@"跳转到第二页" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(pushToSecondPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    

    UIView* redView = [[UIView alloc] initWithFrame:CGRectMake(60, 60, 250, 250)];
    redView.tag = 10;
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
    UIView* yellowView = [[UIView alloc] initWithFrame:CGRectMake(70, 70, 250, 250)];
    yellowView.tag = 12;
    [yellowView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:yellowView];
    
    UIView* greenView = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 250, 250)];
    greenView.tag = 13;
    [greenView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:greenView];
    
    //把一个视图移到最前方
    //[self.view bringSubviewToFront:redView];
    //把一个视图移到最后方
    //[self.view sendSubviewToBack:yellowView];
    //交换两个视图
    NSInteger redIndex = [self.view.subviews indexOfObject:redView];
    NSInteger yellowIndex = [self.view.subviews indexOfObject:yellowView];
    NSInteger greenIndex = [self.view.subviews indexOfObject:greenView];
    
    //只是交换上下层，不是交换实际的位置
    [self.view exchangeSubviewAtIndex:redIndex withSubviewAtIndex:greenIndex];
    //
    _timeLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 200, 50)];
    [_timeLable setBackgroundColor:[UIColor systemPinkColor]];
    _timeLable.text = @"==================";
    [self.view addSubview:_timeLable];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    NSLog(@"屏幕高度 - %f  , 屏幕宽度 - %f",SCREENHEIGHT,SCREENWIDTH);
}

// 跳转按钮点击事件
- (void)pushToSecondPage {
    NSLog(@"导航控制器是否存在？%@", self.navigationController); // 调试输出
//    if (self.navigationController) {
        JsYdViewController *xibView = [[JsYdViewController alloc] init];
        [self.navigationController pushViewController:xibView animated:YES];
//    } else {
//        NSLog(@"错误：self.navigationController 为 nil");
//    }
}
@end
