//
//  IKDoubleSidedView.h
//  Transform
//
//  Created by Igor Kamenev on 26.01.14.
//  Copyright (c) 2014 Igor Kamenev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {

    IKDoubleSidedViewAnimationTypeFade,
    IKDoubleSidedViewAnimationTypeLeft,
    IKDoubleSidedViewAnimationTypeRight,
    IKDoubleSidedViewAnimationTypeLeftRight,
    IKDoubleSidedViewAnimationTypeUp,
    IKDoubleSidedViewAnimationTypeDown,
    IKDoubleSidedViewAnimationTypeUpDown,

} IKDoubleSidedViewType;

@interface IKDoubleSidedView : UIView

@property (nonatomic, strong) UIView* view1;
@property (nonatomic, strong) UIView* view2;

@property (nonatomic) IKDoubleSidedViewType animationType;
@property (nonatomic) NSTimeInterval animationDuration;
@property (nonatomic) UIViewAnimationCurve animationCurve;

- (void) switchView;

@end
