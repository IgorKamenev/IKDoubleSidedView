//
//  IKDoubleSidedView.m
//  Transform
//
//  Created by Igor Kamenev on 26.01.14.
//  Copyright (c) 2014 Igor Kamenev. All rights reserved.
//

#import "IKDoubleSidedView.h"

static NSTimeInterval const kDefaultAnimationDuration = 0.2;
static UIViewAnimationCurve const kDefaultAnimationCurve = UIViewAnimationCurveLinear;

@interface IKDoubleSidedView ()

@property (nonatomic) int viewOnScreen;

@end

@implementation IKDoubleSidedView

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {

        self.viewOnScreen = 0;
        self.animationDuration = kDefaultAnimationDuration;
        self.animationCurve = kDefaultAnimationCurve;
        self.clipsToBounds = YES;

        self.view1 = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:self.view1];

        self.view2 = [[UIView alloc] initWithFrame:self.bounds];
        self.view2.alpha = 0.0;
        [self addSubview:self.view2];

        UILabel* label1 = [[UILabel alloc] initWithFrame:self.bounds];
        label1.backgroundColor = [UIColor greenColor];
        label1.text = @"First side of view";
        [self.view1 addSubview:label1];

        UILabel* label2 = [[UILabel alloc] initWithFrame:self.bounds];
        label2.backgroundColor = [UIColor redColor];
        label2.text = @"Second side of view";
        [self.view2 addSubview:label2];
    }

    return self;
}

- (UIView*) viewForSwitching1
{
    return (self.viewOnScreen == 0)?self.view1:self.view2;
}

- (UIView*) viewForSwitching2
{
    return (self.viewOnScreen == 0)?self.view2:self.view1;
}

- (void) switchView
{
    NSLog(@"start switching");
    switch (self.animationType) {
        case IKDoubleSidedViewAnimationTypeFade: [self doAnimationFade]; break;
        case IKDoubleSidedViewAnimationTypeLeft: [self doAnimationLeft]; break;
        case IKDoubleSidedViewAnimationTypeRight: [self doAnimationRight]; break;
        case IKDoubleSidedViewAnimationTypeLeftRight: [self doAnimationLeftRight]; break;
        case IKDoubleSidedViewAnimationTypeUp: [self doAnimationUp]; break;
        case IKDoubleSidedViewAnimationTypeDown: [self doAnimationDown]; break;
        case IKDoubleSidedViewAnimationTypeUpDown: [self doAnimationUpDown]; break;

        default:
            break;
    }
}


- (void) doAnimationFade
{
    [self animateWithBlock:^{

        self.viewForSwitching1.alpha = 0.0;
        self.viewForSwitching2.alpha = 1.0;

    } completion:^{
        NSLog(@"IKTwoSideViewAnimationTypeFade switching complete");
    }];

}

- (void) doAnimationLeft
{

    self.view1.alpha = 1.0;
    self.view2.alpha = 1.0;

    CGRect rect;

    rect = [self viewForSwitching1].frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    [self viewForSwitching1].frame = rect;

    rect = [self viewForSwitching2].frame;
    rect.origin.x = rect.size.width;
    rect.origin.y = 0;
    [self viewForSwitching2].frame = rect;

    [self animateWithBlock:^{

        CGRect rect = [self viewForSwitching1].frame;
        rect.origin.x = -rect.size.width;
        [self viewForSwitching1].frame = rect;

        rect = [self viewForSwitching2].frame;
        rect.origin.x = 0;
        [self viewForSwitching2].frame = rect;

    } completion:^{
        NSLog(@"IKTwoSideViewAnimationTypeLeft switching complete");
    }];
}

- (void) doAnimationRight
{

    self.view1.alpha = 1.0;
    self.view2.alpha = 1.0;

    CGRect rect;

    rect = [self viewForSwitching1].frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    [self viewForSwitching1].frame = rect;

    rect = [self viewForSwitching2].frame;
    rect.origin.x = -rect.size.width;
    rect.origin.y = 0;
    [self viewForSwitching2].frame = rect;

    [self animateWithBlock:^{

        CGRect rect = [self viewForSwitching1].frame;
        rect.origin.x = rect.size.width;
        [self viewForSwitching1].frame = rect;

        rect = [self viewForSwitching2].frame;
        rect.origin.x = 0;
        [self viewForSwitching2].frame = rect;

    } completion:^{
        NSLog(@"IKTwoSideViewAnimationTypeRight switching complete");
    }];
}

- (void) doAnimationLeftRight
{
    if (self.viewOnScreen == 0) {
        [self doAnimationLeft];
    } else {
        [self doAnimationRight];
    }
}

- (void) doAnimationUp
{

    self.view1.alpha = 1.0;
    self.view2.alpha = 1.0;

    CGRect rect;

    rect = [self viewForSwitching1].frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    [self viewForSwitching1].frame = rect;

    rect = [self viewForSwitching2].frame;
    rect.origin.x = 0;
    rect.origin.y = rect.size.height;
    [self viewForSwitching2].frame = rect;

    [self animateWithBlock:^{

        CGRect rect = [self viewForSwitching1].frame;
        rect.origin.y = -rect.size.height;
        [self viewForSwitching1].frame = rect;

        rect = [self viewForSwitching2].frame;
        rect.origin.y = 0;
        [self viewForSwitching2].frame = rect;

    } completion:^{
        NSLog(@"IKTwoSideViewAnimationTypeUp switching complete");
    }];
}


- (void) doAnimationDown
{

    self.view1.alpha = 1.0;
    self.view2.alpha = 1.0;

    CGRect rect;

    rect = [self viewForSwitching1].frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    [self viewForSwitching1].frame = rect;

    rect = [self viewForSwitching2].frame;
    rect.origin.x = 0;
    rect.origin.y = -rect.size.height;
    [self viewForSwitching2].frame = rect;

    [self animateWithBlock:^{

        CGRect rect = [self viewForSwitching1].frame;
        rect.origin.y = rect.size.height;
        [self viewForSwitching1].frame = rect;

        rect = [self viewForSwitching2].frame;
        rect.origin.y = 0;
        [self viewForSwitching2].frame = rect;

    } completion:^{
        NSLog(@"IKTwoSideViewAnimationTypeDown switching complete");
    }];
}

- (void) doAnimationUpDown
{
    if (self.viewOnScreen == 0) {
        [self doAnimationUp];
    } else {
        [self doAnimationDown];
    }
}

#pragma mark animation helpers

- (void) animateWithBlock:(void (^)(void))animations completion:(void (^)(void)) completion
{
    [self beginAnimationTransaction];
    [CATransaction setCompletionBlock:^{
        [self doAnimationCompleteWithBlock:completion];
    }];
    animations();
    [self endAnimationTransaction];
}

- (void) beginAnimationTransaction
{
    [UIView beginAnimations:@"Animation" context:nil];
    [UIView setAnimationDuration:self.animationDuration];
    [UIView setAnimationCurve:self.animationCurve];
}

- (void) doAnimationCompleteWithBlock:(void (^)(void)) completion
{
    self.viewOnScreen = (self.viewOnScreen == 0)?1:0;
    completion();
}

- (void) endAnimationTransaction
{
    [UIView commitAnimations];
}

@end
