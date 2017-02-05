//
//  JDragonTypeButtonView.m
//  JDragonFrameWork
//
//  Created by long on 15/6/22.
//  Copyright (c) 2015年 姜锦龙. All rights reserved.
//

#import "JDragonTypeButtonView.h"

#define BtnRGBCOLOR(HEX)     [UIColor colorWithRed:((((HEX)>>16)&0xFF))/255. green:((((HEX)>>8)&0xFF))/255.  blue:((((HEX)>>0)&0xFF))/255. alpha:1]
@implementation JDragonTypeButtonView
{
    
    CGFloat  weight;
    CGFloat  height;
    CGFloat  btnHeight;
    CGFloat  btnWidth;
    UILabel  *downLabel;
    CGRect   downLabFrame;
    CGFloat  buttonWeight;
    
    UIColor * btnNormalColor;
    UIColor * btnSelectColor;
    
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //        [self customInit];
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        //        [self customInit];
    }
    return self;
}

- (void)customInit {
    
    [self setBaseView];
}
-(void)setBaseView
{
    weight = self.frame.size.width;
    height = self.frame.size.height;
    //    UIView  *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, weight, 0.5)];
    UIView  *downView = [[UIView alloc]initWithFrame:CGRectMake(0, height-0.5, weight, 0.5)];
    //    topView.backgroundColor = RGBCOLOR(0xcdcdcd);
    downView.backgroundColor = BtnRGBCOLOR(0xcdcdcd);
    btnNormalColor = [UIColor blackColor];
    btnSelectColor = BtnRGBCOLOR(0x4a90e2);
    downLabel = [[UILabel  alloc]init];
    [self addSubview:downLabel];
    //    [self addSubview:topView];
    [self addSubview:downView];
}
/**
 *  设置btn  数组
 *
 *  @param titles        <#titles description#>
 *  @param downLabHeight downLab height
 */
-(void)setTypeButtonTitles:(NSArray*)titles  withDownLableHeight:(CGFloat)downLabHeight andDeleagte:(id<JDragonTypeButtonActionDelegate>)deleget
{
    [self customInit];
    self.delegate = deleget;
    CGFloat  btnWeight = self.frame.size.width/titles.count;
    buttonWeight = btnWeight;
    downLabel.frame = CGRectMake(0, height-downLabHeight, btnWeight, downLabHeight);
    downLabel.backgroundColor = BtnRGBCOLOR(0x4a90e2);
    downLabFrame = downLabel.frame;
    [self addSubview:downLabel];
    for (int  i=0; i<titles.count; i++)
    {
        NSString  *title = titles[i];
        UIButton  *typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [typeBtn setTitle:title forState:UIControlStateNormal];
        [typeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [typeBtn setTitleColor:BtnRGBCOLOR(0x4a90e2) forState:UIControlStateSelected];
        [typeBtn setTitleColor:BtnRGBCOLOR(0x4a90e2)forState:UIControlStateHighlighted];
        
        typeBtn.frame = CGRectMake(i*btnWeight, 0, btnWeight, height);
        
//        if(self.buttonEnum==JDragonTypeBtnFind)
//        {
//            if (i == 4) {
//                typeBtn.frame = CGRectMake(i*btnWeight-7, 0, btnWeight+14, height);
//            }
//        }
        
        typeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        typeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        typeBtn.tag = 12345+i;
        [typeBtn addTarget:self action:@selector(didClickTypeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:typeBtn];
//        if (self.buttonEnum==JDragonTypeBtnFind) {
//            if (i == 0 || i == 1 || i==3 || i ==6 || i ==5 ) {
//                typeBtn.enabled = false;
//            }
//        }
    }
    [self setSelectTypeIndex:0];
}

-(void)didClickTypeButtonAction:(UIButton*)button
{
    NSInteger  index = button.tag - 12345;
    [self setSelectTypeIndex:index];
    
    if ([self.delegate respondsToSelector:@selector(didClickTypeButtonAction:withIndex:)]) {
        [self.delegate didClickTypeButtonAction:button withIndex:index];
    }
}
-(void)setSelectTypeIndex:(NSInteger)index
{
    UIButton *btn = [self viewWithTag:12345+index];
    //    btn.selected = !btn.selected;
    for (UIView  *view in self.subviews) {
        
        if([view  isKindOfClass:[UIButton  class]]){
            
            UIButton  *abutton = (UIButton*)view;
            if (abutton.tag==index+12345) {
                abutton.selected = YES ;
                [abutton setTitleColor:btnSelectColor forState:UIControlStateNormal];
                
            }else {
                abutton.selected = NO;
                [abutton setTitleColor:btnNormalColor forState:UIControlStateNormal];
                
            }
            
        }
    }
    if (btn.selected) {
        
        downLabFrame.origin.x = btn.frame.origin.x;
        downLabFrame.size.width = btn.frame.size.width;
        [self bringSubviewToFront:btn];
        
        [UIView  animateWithDuration:.2 animations:^{
            downLabel.frame = downLabFrame;
            
        } completion:^(BOOL finished) {
            
            
        }];
    }
}
/**
 *  设置选中button
 *
 *  @param index <#index description#>
 */
-(void)setSelectButtonIndex:(NSInteger)index
{
    
    [self setSelectTypeIndex:index];
}
/**
 *  设置typeBtn选中Color
 *
 *  @param normalColor 默认Color
 *  @param selectColor 选中Color
 */
-(void)setTypeButtonNormalColor:(UIColor*)normalColor andSelectColor:(UIColor*)selectColor
{
    btnNormalColor = normalColor;
    btnSelectColor = selectColor;
    for (UIView  *view in self.subviews) {
        
        if([view  isKindOfClass:[UIButton  class]]){
            UIButton  *abutton = (UIButton*)view;
            [abutton setTitleColor:normalColor forState:UIControlStateNormal];
            [abutton setTitleColor:selectColor forState:UIControlStateSelected];
            [abutton setTitleColor:selectColor forState:UIControlStateHighlighted];
            
        }
    }
    downLabel.backgroundColor = selectColor;
}
/**
 *  设置Downlable选中Color
 *
 *  @param selectColor <#selectColor description#>
 */
-(void)setTypeDownlableSelectColor:(UIColor*)selectColor
{
    downLabel.backgroundColor = selectColor;
}
/**
 *  设置Downlable Heoght
 *
 *  @param
 */
-(void)setTypeDownlableHeight:(CGFloat)h
{
    downLabel.frame = CGRectMake(0, height-h, buttonWeight, h);
    
}
@end
