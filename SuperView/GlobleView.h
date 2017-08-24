//
//  GlobleView.h
//  SuperView
//
//  Created by love on 2017/8/23.
//  Copyright © 2017年 guanal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMDragView.h"
#import "PopoverView.h"
@interface GlobleView : NSObject

@property (nonatomic, strong) WMDragView * globleView;

+(instancetype)shareGloble;

/**
 初始化
 */
-(void)setupUI;
-(void)setupUIWithframe:(CGRect)rect;


/**
 显示视图
 */
-(void)showGlobalView;

/**
 隐藏
 */
-(void)hideGlobalView;


@end
