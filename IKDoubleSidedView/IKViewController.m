//
//  IKViewController.m
//  IKDoubleSidedView
//
//  Created by Igor Kamenev on 26.01.14.
//  Copyright (c) 2014 Igor Kamenev. All rights reserved.
//

#import "IKViewController.h"
#import "IKDoubleSidedView.h"

@interface IKViewController ()

@property (nonatomic, strong) IKDoubleSidedView* twoSideView;

@end

@implementation IKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.twoSideView = [[IKDoubleSidedView alloc] initWithFrame:CGRectMake(0, 50, 320, 100)];
    self.twoSideView.animationType = IKDoubleSidedViewAnimationTypeLeftRight;
    self.twoSideView.animationDuration = 0.4;
    self.twoSideView.animationCurve = UIViewAnimationCurveEaseInOut;

    [self.view addSubview:self.twoSideView];

    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];

    [self.view addGestureRecognizer:tap];
}

- (void) tap
{
    [self.twoSideView switchView];
}

@end
