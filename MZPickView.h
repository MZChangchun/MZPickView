//
//  MZPickView.h
//  CaiHeAPP
//
//  Created by Mr.Yang on 16/4/25.
//  Copyright © 2016年 Mr.Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MZPickView;
@protocol MZPickViewDelegate <NSObject>

@optional
- (void)pick:(MZPickView *)pick selectMZPickView:(id)selectDict;

@end

@interface MZPickView : UIView

@property(nonatomic, weak) id<MZPickViewDelegate> delegate;

@property (nonatomic, copy)NSString * defaultName;

-(instancetype)initWithFrame:(CGRect)frame selectArray:(NSArray *)array;//初始化

@end
