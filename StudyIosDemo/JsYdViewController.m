//
//  JsYdViewController.m
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/4/30.
//

#import "JsYdViewController.h"

@interface JsYdViewController ()

@property (nonatomic, strong)  UILabel *jia;
@property (nonatomic, strong)  UILabel *deng;
@property (nonatomic, strong)  UILabel *jieguo;

@property (nonatomic, strong)  UIButton *shang;
@property (nonatomic, strong)  UIButton *xia;
@property (nonatomic, strong)  UIButton *zuo;
@property (nonatomic, strong)  UIButton *you;
@property (nonatomic, strong)  UIButton *fangda;
@property (nonatomic, strong)  UIButton *suoxiao;

@property (nonatomic, strong)  UITextField *number1;
@property (nonatomic, strong)  UITextField *number2;
@property (nonatomic, strong)  UILabel *lblResult;
@property (nonatomic, strong)  UIButton *pingyi;
@property (nonatomic, strong)  UIButton *xuanzhuan;
@property (nonatomic, strong)  UIButton *suofang;
@property (nonatomic, strong)  UIButton *fuwei;
@property (nonatomic, strong)  UITextField *password;
@property (nonatomic, strong)  UIButton *jisuan;
@property (nonatomic, strong)  UIButton *qingping;

@property (nonatomic,assign) int index;
@property (nonatomic,strong) NSArray *pic;

@end

@implementation JsYdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"计算和移动";
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreatView];
    // Do any additional setup after loading the view.
}
- (void) CreatView{
    [self.view addSubview:self.number1];
    [self.view addSubview:self.number2];
    [self.view addSubview:self.lblResult];
    [self.view addSubview:self.pingyi];
    [self.view addSubview:self.xuanzhuan];
    [self.view addSubview:self.suofang];
    [self.view addSubview:self.fuwei];
    [self.view addSubview:self.password];
    [self.view addSubview:self.jisuan];
    [self.view addSubview:self.qingping];
    
    [self.view addSubview:self.jia];
    [self.view addSubview:self.deng];
    [self.view addSubview:self.shang];
    [self.view addSubview:self.xia];
    [self.view addSubview:self.zuo];
    [self.view addSubview:self.you];
    [self.view addSubview:self.fangda];
    [self.view addSubview:self.suoxiao];
    [self.view addSubview:self.jieguo];
}
- (UILabel *)jia {
    if(!_jia){
        _jia = [[UITextField alloc]initWithFrame:CGRectMake(113, 76, 11, 21)];
        _jia.text = @"+";
    }
    return _jia;
}
- (UILabel *)deng {
    if(!_deng){
        _deng = [[UITextField alloc]initWithFrame:CGRectMake(237, 76, 11, 21)];
        _deng.text = @"=";
    }
    return _deng;
}
- (UILabel *)jieguo {
    if(!_jieguo){
        _jieguo = [[UITextField alloc]initWithFrame:CGRectMake(277, 76, 100, 21)];
        _jieguo.text = @"0";
    }
    return _jieguo;
}
- (UIButton *)shang {
    if(!_shang){
        _shang = [[UIButton alloc]initWithFrame:CGRectMake(70, 507, 35, 35)];
        [_shang setTitle:@"^" forState:UIControlStateNormal];
        [_shang setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _shang;
}
- (UIButton *)xia  {
    if(!_xia){
        _xia = [[UIButton alloc]initWithFrame:CGRectMake(71, 565, 35, 35)];
        [_xia setTitle:@"v" forState:UIControlStateNormal];
        [_xia setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _xia;
}
- (UIButton *)zuo {
    if(!_zuo){
        _zuo = [[UIButton alloc]initWithFrame:CGRectMake(35, 535, 35, 35)];
        [_zuo setTitle:@"<" forState:UIControlStateNormal];
        [_zuo setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _zuo;
}
- (UIButton *)you {
    if(!_you){
        _you = [[UIButton alloc]initWithFrame:CGRectMake(101, 535, 35, 35)];
        [_you setTitle:@">" forState:UIControlStateNormal];
        [_you setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _you;
}
- (UIButton *)fangda {
    if(!_fangda){
        _fangda = [[UIButton alloc]initWithFrame:CGRectMake(238, 535, 35, 35)];
        [_fangda setTitle:@"+" forState:UIControlStateNormal];
        [_fangda setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _fangda;
}
- (UIButton *)suoxiao {
    if(!_suoxiao){
        _suoxiao = [[UIButton alloc]initWithFrame:CGRectMake(311, 535, 35, 35)];
        [_suoxiao setTitle:@"-" forState:UIControlStateNormal];
        [_suoxiao setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _suoxiao;
}

- (UITextField *)number1 {
    if(!_number1){
        _number1 = [[UITextField alloc]initWithFrame:CGRectMake(16, 70, 73, 34)];
        _number1.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _number1;
}
- (UITextField *)number2 {
    if(!_number2){
        _number2 = [[UITextField alloc]initWithFrame:CGRectMake(151, 70, 73, 34)];
        _number2.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _number2;
}
- (UILabel *)lblResult {
    if(!_lblResult){
        _lblResult = [[UILabel alloc]initWithFrame:CGRectMake(277, 76, 100, 21)];
    }
    return _lblResult;
}
- (UIButton *)pingyi {
    if(!_pingyi){
        _pingyi = [[UIButton alloc]initWithFrame:CGRectMake(24, 409, 59, 35)];
        [_pingyi setTitle:@"平移" forState:UIControlStateNormal];
        [_pingyi setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _pingyi;
}
- (UIButton *)xuanzhuan {
    if(!_xuanzhuan){
        _xuanzhuan = [[UIButton alloc]initWithFrame:CGRectMake(167, 409, 59, 35)];
        [_xuanzhuan setTitle:@"旋转" forState:UIControlStateNormal];
        [_xuanzhuan setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _xuanzhuan;
}
- (UIButton *)suofang {
    if(!_suofang){
        _suofang = [[UIButton alloc]initWithFrame:CGRectMake(307, 409, 59, 35)];
        [_suofang setTitle:@"缩放" forState:UIControlStateNormal];
        [_suofang setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _suofang;
}
- (UIButton *)fuwei {
    if(!_fuwei){
        _fuwei = [[UIButton alloc]initWithFrame:CGRectMake(167, 452, 59, 35)];
        [_fuwei setTitle:@"复位" forState:UIControlStateNormal];
        [_fuwei setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _fuwei;
}
- (UITextField *)password {
    if(!_password){
        _password = [[UITextField alloc]initWithFrame:CGRectMake(277, 120, 97, 34)];
        _password.borderStyle = UITextBorderStyleRoundedRect;
        _password.secureTextEntry = YES;
    }
    return _password;
}
- (UIButton *)jisuan {
    if(!_jisuan){
        _jisuan = [[UIButton alloc]initWithFrame:CGRectMake(16, 137, 182, 102)];
        [_jisuan setTitle:@"计算" forState:UIControlStateNormal];
        [_jisuan setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _jisuan;
}
- (UIButton *)qingping {
    if(!_qingping){
        _qingping = [[UIButton alloc]initWithFrame:CGRectMake(167, 495, 59, 35)];
        [_qingping setTitle:@"清屏" forState:UIControlStateNormal];
        [_qingping setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return _qingping;
}
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
//点击按钮时间
- (IBAction)buttonClick {
    NSLog(@"-----buttonClick-------");
}
//点击按钮时间
- (IBAction)compute {
    NSLog(@"------------");
}
//清屏
- (IBAction)qingping:(id)sender {
    //根据tag获取空间,类型强转
    //UITextField *tagView = (UITextField *)[self.view viewWithTag:1000];
    //tagView.textColor = [UIColor redColor];
    //删除控件
    //[tagView removeFromSuperview];
    //[self.password removeFromSuperview];
    //从父控件中移除
    while(self.view.subviews.firstObject){
        [self.view.subviews.firstObject removeFromSuperview];
    }
}
//复位
- (IBAction)fuwei:(id)sender {
    //清空之前设置的属性
    self.jisuan.transform = CGAffineTransformIdentity;
    self.pingyi.transform = CGAffineTransformIdentity;
    self.suofang.transform = CGAffineTransformIdentity;
    self.xuanzhuan.transform = CGAffineTransformIdentity;
}
//缩放
- (IBAction)suofang:(id)sender {
    self.jisuan.transform = CGAffineTransformScale(self.jisuan.transform, 1.1,1.1);
}
//旋转
- (IBAction)xuanzhuan:(id)sender {
    self.jisuan.transform = CGAffineTransformRotate(self.jisuan.transform, -M_PI_4);
}
//平移
- (IBAction)pingyi:(id)sender {
    self.jisuan.transform = CGAffineTransformTranslate(self.jisuan.transform, 5,5);
}

- (IBAction) jisuan:(id)sender {
    //获取用户输入数据
    NSString* str1 = self.number1.text;
    NSString* str2 = self.number2.text;
    int n1 = str1.intValue;
    int n2 = str2.intValue;
    //计算和
    int sum = n1 + n2;
    //显示结果
    self.lblResult.text = [NSString stringWithFormat:@"%d",sum];
    NSLog(@"密码: %@",self.password.text);
    //谁调出键盘谁就是第一响应者，让第一响应者辞职就可以把键盘收回
    //响应者辞职
//    self.password.resignFirstResponder;
//    self.number1.resignFirstResponder;
//    self.number2.resignFirstResponder;
    //当前view停止编辑，也可以退出键盘
    [self.view endEditing:YES];
    //平移
    self.pingyi.transform = CGAffineTransformMakeTranslation(0, -50);
    //旋转
    self.xuanzhuan.transform = CGAffineTransformMakeRotation(M_PI_4);
    //缩放
    self.suofang.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
    //获取父类控件
    UIView *supV = self.jisuan.superview;
    supV.backgroundColor = [UIColor yellowColor];
    NSLog(@"jisuan 父类控件 %@",supV);
    //所有子类空间
    NSArray *nsa = self.view.subviews;
    for(UIView *subA in nsa){
        subA.backgroundColor = [UIColor greenColor];
        NSLog(@"view 子类控件 %@",supV);
    }
    //根据tag获取空间,类型强转
    UITextField *tagView = (UITextField *)[self.view viewWithTag:1000];
    tagView.textColor = [UIColor redColor];
}

- (IBAction)suoxiao:(id)sender {
    //frame的坐标位置 相对于父视图，bounds有坐标但是针对自身的，永远是0，0
    //掌握frame［包含位置和大小）、center（只能修改位置）、bounds［只能修改大小｝bransfprm[位置、大小、旋转都可以] 的使用
    //获取按钮坐标和大小
    CGRect cgr1 = self.jisuan.frame;
    cgr1.size.width*=0.9;
    cgr1.size.height*=0.9;
    self.jisuan.frame = cgr1;
    NSLog(@"缩小 tag值为:%ld",[sender tag]);
    self.index--;
    if(self.index<0){
        self.index = - self.index;
    }
    NSDictionary *nsd = self.pic[self.index%self.pic.count];
    UIImage *imgNormal = [UIImage imageNamed:[nsd valueForKey:@"name"]];
    [self.jisuan setBackgroundImage:imgNormal forState:UIControlStateNormal];
}

- (IBAction)fangda:(id)sender {
    //bounds有为位置信息单x,y始终是0，0 无法改变位置
    CGRect cgr1 = self.jisuan.bounds;
    cgr1.size.width*=1.1;
    cgr1.size.height*=1.1;
    self.jisuan.bounds = cgr1;
    NSLog(@"放大 tag值为:%ld",[sender tag]);
    self.index++;
    NSDictionary *nsd = self.pic[self.index%self.pic.count];
    UIImage *imgNormal = [UIImage imageNamed:[nsd valueForKey:@"name"]];
    [self.jisuan setBackgroundImage:imgNormal forState:UIControlStateNormal];
}

- (IBAction)shangyi:(id)sender{
    //通过动画的方式执行
    //开启动画
    [UIView beginAnimations:nil context:nil];
    //设置动画执行时间
    [UIView setAnimationDuration:0.5];
    
    CGRect cgr1 = self.jisuan.frame;
    cgr1.origin.y-=10;
    self.jisuan.frame = cgr1;
    NSLog(@"向上 tag值为:%ld",[sender tag]);
    //提交动画
    [UIView commitAnimations];
    
    
}

- (IBAction)xiayi:(id)sender {
    //block方式实现动画效果
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint cgp1 = self.jisuan.center;
        cgp1.y+=10;
        self.jisuan.center = cgp1;
        NSLog(@"向下 tag值为:%ld",[sender tag]);
    }];
}

- (IBAction)zuoyi:(id)sender {
    CGRect cgr1 = self.jisuan.frame;
    cgr1.origin.x-=10;
    self.jisuan.frame = cgr1;
    NSLog(@"向左 tag值为:%ld",[sender tag]);
}

- (IBAction)youyi:(id)sender {
    CGRect cgr1 = self.jisuan.frame;
    cgr1.origin.x+=10;
    self.jisuan.frame = cgr1;
    NSLog(@"向右 tag值为:%ld",[sender tag]);
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
