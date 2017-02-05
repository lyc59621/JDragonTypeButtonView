//
//  JDragonTypeButtonView.h
//  JDragonFrameWork
//
//  Created by long on 15/6/22.
//  Copyright (c) 2015年 姜锦龙. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef enum TypeButtonEnum:NSUInteger
//{
//    JDragonTypeBtnDefault,
//    JDragonTypeBtnFind,
//    
//    
//}JDragonTypeButtonEnum;


@protocol JDragonTypeButtonActionDelegate <NSObject>

@optional

-(void)didClickTypeButtonAction:(UIButton*)button withIndex:(NSInteger)index;

@end


@interface JDragonTypeButtonView : UIView
//@property(nonatomic,assign) JDragonTypeButtonEnum  buttonEnum;
@property(nonatomic,assign) id<JDragonTypeButtonActionDelegate> delegate;

/**
 *  设置btn  数组
 *
 *  @param titles        <#titles description#>
 *  @param downLabHeight downLab height
 */
-(void)setTypeButtonTitles:(NSArray*)titles  withDownLableHeight:(CGFloat)downLabHeight andDeleagte:(id<JDragonTypeButtonActionDelegate>)deleget;



/**
 *  设置选中button
 *
 *  @param index <#index description#>
 */
-(void)setSelectButtonIndex:(NSInteger)index;

/**
 *  设置typeBtn选中Color
 *
 *  @param normalColor 默认Color
 *  @param selectColor 选中Color
 */
-(void)setTypeButtonNormalColor:(UIColor*)normalColor andSelectColor:(UIColor*)selectColor;


/**
 *  设置Downlable选中Color
 *
 *  @param selectColor <#selectColor description#>
 */
-(void)setTypeDownlableSelectColor:(UIColor*)selectColor;


/**
 *  设置Downlable Heoght
 *
 *  @param
 */
-(void)setTypeDownlableHeight:(CGFloat)h;

@end
