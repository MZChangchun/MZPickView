//
//  MZPickView.m
//  CaiHeAPP
//
//  Created by Mr.Yang on 16/4/25.
//  Copyright © 2016年 Mr.Yang. All rights reserved.
//

#import "MZPickView.h"


@interface MZPickView ()<UIPickerViewDataSource>
@property (nonatomic, strong)UIButton * selectButton;
@property (nonatomic, strong)UIPickerView * pickView;
@property (nonatomic, strong)NSArray *arrray;

@property (nonatomic, strong)id dict;
@end

@implementation MZPickView

-(instancetype)initWithFrame:(CGRect)frame selectArray:(NSArray *)array{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.arrray = [[NSArray alloc] initWithArray:array];
//        self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 80, frame.size.width, frame.size.height - 80)];
        if (!self.arrray ) {
            return nil;
        }
        
        self.pickView = [[UIPickerView alloc] initWithFrame:CGRectZero];
        NSLog(@"%f", frame.size.height - 40);
        
        CALayer *viewLayer = self.pickView.layer;
        
        [viewLayer setFrame:CGRectMake(0, 80, frame.size.width, frame.size.height - 80)];
        
        [viewLayer setBorderWidth:0];
        
        
        self.pickView.showsSelectionIndicator = 1;
        self.dict = self.arrray[0];
        self.pickView.delegate = self;
        self.pickView.backgroundColor = [UIColor whiteColor];//背景颜色
        self.pickView.alpha = 0.97;
        [self addSubview:self.pickView];
        
        UILabel * topLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 80)];
        topLab.backgroundColor = [UIColor colorWithRed:185/255.0 green:186/255.0 blue:186/255.0 alpha:1];
        [self addSubview:topLab];
        
        //状态栏
        UILabel * statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width , DEVICE_STATUE_HEIGH)];
        statusLabel.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:94 / 255.0 blue:163/255.0 alpha:1];
        [self addSubview:statusLabel];
        
        self.selectButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - 105, 5 + DEVICE_STATUE_HEIGH, 100, 70 - DEVICE_STATUE_HEIGH)];
        [self.selectButton setTitle:@"确定" forState:UIControlStateNormal];
        self.selectButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
        [self.selectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.selectButton addTarget:self action:@selector(selectClass) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.selectButton];
        
        UIButton * backButt = [[UIButton alloc] initWithFrame:CGRectMake(5, 5 + DEVICE_STATUE_HEIGH, 100, 70 - DEVICE_STATUE_HEIGH)];
        [backButt setTitle:@"   返回" forState:UIControlStateNormal];
        [backButt setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        backButt.titleLabel.font = [UIFont systemFontOfSize:17.0];
        [backButt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backButt addTarget:self action:@selector(backAndRemove) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backButt];
        
        backButt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        backButt.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        self.selectButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        self.selectButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    }
    return self;
}

-(void)setDefaultName:(NSString *)defaultName{
    
    _defaultName  = defaultName;
    for (int i = 0; i < self.arrray.count; i ++) {
        if ([defaultName isEqualToString:self.arrray[i][@"zymc"]]) {
            [self.pickView selectRow:i inComponent:0 animated:YES];
            self.dict = self.arrray[i];
            break;
        }
    }
}

#pragma mark-UIPickerViewDataSource
// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.arrray.count;
}

// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.frame.size.width;
}
//选中的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.dict = self.arrray[row];
    
}
//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.arrray[row][@"zymc"];
}

#pragma mark - delegate
- (void)selectClass{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(pick:selectMZPickView:)]) {
        [self.delegate  pick:self selectMZPickView:self.dict ];
        [self removeFromSuperview];
    }
}


//返回按钮
- (void)backAndRemove{
    [self removeFromSuperview];
}

@end
