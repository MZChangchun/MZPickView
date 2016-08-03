# MZPickView
This is a pie 
这是一个扇形图控件
包含完整性监测
使用方法如下：
创建数组存放特定的成员：
 NSMutableArray * array = [NSMutableArray arrayWithCapacity:0];
    ProModel * mode = [[ProModel alloc] init];
    mode.color = [UIColor yellowColor];
    mode.percent = 40;
    [array addObject:mode];
    
    ProModel * mode2 = [[ProModel alloc] init];
    mode2.color = [UIColor redColor];
    mode2.percent = 30;
    [array addObject:mode2];
    
    ProModel * mode3 = [[ProModel alloc] init];
    mode3.color = [UIColor blueColor];
    mode3.percent = 30;
    [array addObject:mode3];
    
    创建PieView并将数组赋值
    PieView * pie = [[PieView alloc] initWithFrame:CGRectMake(10, 250, 200, 400)];
    [self.view addSubview:pie];
     pie.array = array;
