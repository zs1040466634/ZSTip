//
//  WYBroadcastingTipView.h
//  smartcampus
//
//  Created by 大智云校2 on 2019/6/15.
//  Copyright © 2019 大智云校. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYBroadcastingTipView : UIControl

/** 点击消失回调 */
@property (nonatomic, copy) void (^closeBlock)(void);

/**
 初始化视图

 @param title 标题
 @param subTitle 副标题
 @param description 描述
 @return 视图
 */
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle description:(NSString *)description;

/**
 动画展示

 @param completion 动画完成回调
 */
- (void)showWithAnimationCompletion:(void(^)(void))completion;

/**
 动画消失
 */
- (void)removeWithAnimation;

@end

NS_ASSUME_NONNULL_END
