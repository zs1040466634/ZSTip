//
//  WYBroadcastingTipView.m
//  smartcampus
//
//  Created by 大智云校2 on 2019/6/15.
//  Copyright © 2019 大智云校. All rights reserved.
//
//  分班播报提示框

#import "WYBroadcastingTipView.h"

@interface WYBroadcastingTipView ()

/** 标题 */
@property (nonatomic, strong) NSString *title;
/** 描述 */
@property (nonatomic, strong) NSString *descriptionStr;
/** 背景视图 */
@property (nonatomic, strong) UIView *bgView;

@end

@implementation WYBroadcastingTipView



- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle description:(NSString *)description
{
    self = [super init];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        self.title = title;
        self.descriptionStr = description;
        
        //设置视图
        [self setupView];
        
        //点击背景消失
        [self addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
        
        
//        //展示
//        [self showWithAnimationCompletion:^{
//            
//        }];
        
    }
    return self;
}

/**
 设置视图
 */
- (void)setupView {
    
    //布局
    if (self.title.length > 4) {
        //获取前4个字
        self.title = [self.title substringToIndex:4];
        self.title = [self.title stringByAppendingString:@"..."];
    }
    //背景白色视图
    UIView *bgView = [[UIView alloc]init];
    self.bgView = bgView;
    bgView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    bgView.center = self.center;
    bgView.backgroundColor = [UIColor lightGrayColor];
    bgView.layer.cornerRadius = 4;
    bgView.layer.masksToBounds = YES;
    [self addSubview:bgView];
    
    //标题以及副标题的背景
    UIView *textBgView = [[UIView alloc]init];
    textBgView.frame = CGRectMake(42, 20, [UIScreen mainScreen].bounds.size.width - 42 * 2, 35);
    [bgView addSubview:textBgView];
    //标题
    UILabel *titleLabel = [self labelInitText:self.title font:[UIFont systemFontOfSize:25] textColor:[UIColor blueColor] textAlignment:NSTextAlignmentCenter];
    titleLabel.frame = CGRectMake(0, 0, textBgView.frame.size.width, 35);
    [textBgView addSubview:titleLabel];
    //描述
    UILabel *desLabel = [self labelInitText:self.descriptionStr font:[UIFont systemFontOfSize:17] textColor:[UIColor grayColor] textAlignment:NSTextAlignmentCenter];
    desLabel.frame = CGRectMake(0, 55, [UIScreen mainScreen].bounds.size.width, 24);
    [bgView addSubview:desLabel];
    
    
}

- (void)showWithAnimationCompletion:(void(^)(void))completion {
    self.bgView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration:0.5f animations:^{
        self.bgView.transform = CGAffineTransformIdentity;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (finished) {
            if (completion) {
                completion();
            }
        }
    }];
    
}


- (void)tapAction {
    if (self.closeBlock) {
        self.closeBlock();
    }
    [self removeWithAnimation];
}

- (void)removeWithAnimation {
//    [UIView animateWithDuration:0.5f animations:^{
//        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(100);
//        }];
//        //告知父类控件绘制
//        [self layoutIfNeeded];
//    } completion:^(BOOL finished) {
//        if (finished) {
//
//        }
//    }];
    [self removeFromSuperview];
}



- (UILabel *)labelInitText:(NSString *)initText font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc]init];
    label.font = font ;
    label.numberOfLines = 0;
    label.text = (initText == nil ? nil : initText);
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    return label;
}


@end
