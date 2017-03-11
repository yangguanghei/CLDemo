//
//  AIMaxChartLegendView.m
//  CKD
//
//  Created by 艾泽鑫 on 2017/2/6.
//  Copyright © 2017年 JmoVxia. All rights reserved.
//  全屏的时候图例

#import "AIMaxChartLegendView.h"
#import "UIColor+AIExtension.h"
@interface AIMaxChartLegendView ()
@property(nonatomic,weak)UIButton *weekBtn;
/** 一个月*/
@property(nonatomic,weak)UIButton *oneMonthBtn;
/** 三个月*/
@property(nonatomic,weak)UIButton *threeMonthBtn;
/** 六个月*/
@property(nonatomic,weak)UIButton *sixMonthBtn;
/** 一年*/
@property(nonatomic,weak)UIButton *yearBtn;
/** 缩放*/
@property(nonatomic,weak)UIButton *zoomBtn;
/** 被选中的button*/
@property(nonatomic,weak)UIButton *selectedBtn;
@end

@implementation AIMaxChartLegendView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //一周
        UIButton *weekBtn           = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.weekBtn                = weekBtn;
        [weekBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:(UIControlStateNormal)];
        [weekBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:(UIControlStateSelected)];
        [weekBtn setTitle:@"一周" forState:(UIControlStateNormal)];
        [self addSubview:weekBtn];
        [weekBtn addTarget:self action:@selector(onClickWeek:) forControlEvents:(UIControlEventTouchUpInside)];
        //一个月
        UIButton *oneMonthBtn           = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.oneMonthBtn                = oneMonthBtn;
        [oneMonthBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:(UIControlStateNormal)];
        [oneMonthBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:(UIControlStateSelected)];
        [oneMonthBtn setTitle:@"1个月" forState:(UIControlStateNormal)];
        [self addSubview:oneMonthBtn];
        [oneMonthBtn addTarget:self action:@selector(onClickOneMonthBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        //3
        UIButton *threeMonthBtn           = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.threeMonthBtn                = threeMonthBtn;
        [threeMonthBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:(UIControlStateNormal)];
        [threeMonthBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:(UIControlStateSelected)];
        [threeMonthBtn setTitle:@"3个月" forState:(UIControlStateNormal)];
        [self addSubview:threeMonthBtn];
        [threeMonthBtn addTarget:self action:@selector(onClickThreeMonthBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        //6
        UIButton *sixMonthBtn           = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.sixMonthBtn                = sixMonthBtn;
        [sixMonthBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:(UIControlStateNormal)];
        [sixMonthBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:(UIControlStateSelected)];
        [sixMonthBtn setTitle:@"6个月" forState:(UIControlStateNormal)];
        [self addSubview:sixMonthBtn];
        [sixMonthBtn addTarget:self action:@selector(onClickSixMonthBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        //year
        UIButton *yearBtn           = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.yearBtn                = yearBtn;
        [yearBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:(UIControlStateNormal)];
        [yearBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:(UIControlStateSelected)];
        [yearBtn setTitle:@"一年" forState:(UIControlStateNormal)];
        [self addSubview:yearBtn];
        [yearBtn addTarget:self action:@selector(onClickYearBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        //缩放
        UIButton *zoomBtn           = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.zoomBtn                = zoomBtn;
        [self addSubview:zoomBtn];
        [zoomBtn setImage:[UIImage imageNamed:@"collapse_icon"] forState:(UIControlStateNormal)];
        [zoomBtn addTarget:self action:@selector(onClickZoomBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        
        
    }
    return self;
}

- (void)fitUI {
    self.weekBtn.frame = CGRectMake(0, 0, (self.CLwidth - 60)/5.0, 40);
    self.oneMonthBtn.frame = CGRectMake(self.weekBtn.CLright, 0, self.weekBtn.CLwidth, 40);
    self.threeMonthBtn.frame = CGRectMake(self.oneMonthBtn.CLright, 0, self.weekBtn.CLwidth, 40);
    self.sixMonthBtn.frame = CGRectMake(self.threeMonthBtn.CLright, 0, self.weekBtn.CLwidth, 40);
    self.yearBtn.frame = CGRectMake(self.sixMonthBtn.CLright, 0, self.weekBtn.CLwidth, 40);
    self.zoomBtn.frame = CGRectMake(self.yearBtn.CLright + 10, 0, 40, 40);
}

#pragma mark -Action 
- (void)onClickWeek:(UIButton*)btn {
    self.selectedBtn.selected = !self.selectedBtn.isSelected;
    btn.selected              = !btn.isSelected;
    self.selectedBtn = btn;
    if (self.delegate && [self.delegate respondsToSelector:@selector(maxChartLegendViewDidSelectedWeek:)]) {
        [self.delegate maxChartLegendViewDidSelectedWeek:btn];
    }
}
- (void)onClickOneMonthBtn:(UIButton*)btn {
    self.selectedBtn.selected = !self.selectedBtn.isSelected;
    btn.selected              = !btn.isSelected;
    self.selectedBtn = btn;
    if (self.delegate && [self.delegate respondsToSelector:@selector(maxChartLegendViewDidSelectedOneMonth:)]) {
        [self.delegate maxChartLegendViewDidSelectedOneMonth:btn];
    }
}
- (void)onClickThreeMonthBtn:(UIButton*)btn {
    self.selectedBtn.selected = !self.selectedBtn.isSelected;
    btn.selected              = !btn.isSelected;
    self.selectedBtn = btn;
    if (self.delegate && [self.delegate respondsToSelector:@selector(maxChartLegendViewDidSelectedThreeMonth:)]) {
        [self.delegate maxChartLegendViewDidSelectedThreeMonth:btn];
    }
}
- (void)onClickSixMonthBtn:(UIButton*)btn {
    self.selectedBtn.selected = !self.selectedBtn.isSelected;
    btn.selected              = !btn.isSelected;
    self.selectedBtn = btn;
    if (self.delegate && [self.delegate respondsToSelector:@selector(maxChartLegendViewDidSelectedSixMonth:)]) {
        [self.delegate maxChartLegendViewDidSelectedSixMonth:btn];
    }
}
- (void)onClickYearBtn:(UIButton*)btn {
    self.selectedBtn.selected = !self.selectedBtn.isSelected;
    btn.selected              = !btn.isSelected;
    self.selectedBtn = btn;
    if (self.delegate && [self.delegate respondsToSelector:@selector(maxChartLegendViewDidSelectedYear:)]) {
        [self.delegate maxChartLegendViewDidSelectedYear:btn];
    }
}
- (void)onClickZoomBtn:(UIButton*)btn {
    if (self.zoomBlock) {
        self.zoomBlock();
    }
}

- (void)selectedFirst {
    [self onClickWeek:self.weekBtn];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self fitUI];
}




@end
