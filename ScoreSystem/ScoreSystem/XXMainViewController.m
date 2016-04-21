//
//  XXMainViewController.m
//  ScoreSystem
//
//  Created by wangwendong on 16/4/21.
//  Copyright © 2016年 fengxiaoxia. All rights reserved.
//

#import "XXMainViewController.h"


typedef NS_ENUM(NSInteger, XXMainFuncButtonsType) {
    XXMainFuncButtonsTypeScore = 0,
    XXMainFuncButtonsTypePassScore,
    XXMainFuncButtonsTypeNoPassScore,
    XXMainFuncButtonsTypeCourseTable,
    XXMainFuncButtonsTypeExamTime
};

@interface XXMainViewController () <UITableViewDelegate, UITableViewDataSource>

// ARC strong, weak
// MRC assign, retain
// copy

@property (strong, nonatomic) NSArray *funcButtonTitles;
@property (strong, nonatomic) NSMutableArray *funcButtons;
@property (strong, nonatomic) UITableView *infoTableView;

@end

@implementation XXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupParameters];
    
    [self setupFuncButtons];
    
    [self setupInfoTableView];
}

#pragma mark - Public


#pragma mark - Private 

- (void)setupParameters {
    _funcButtonTitles = @[@"成绩", @"不及格成绩", @"及格", @"课程", @"考试时间"];
    
    _funcButtons = [NSMutableArray array];
}

- (void)setupFuncButtons {
    for (int i = 0; i < 5; i++) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:_funcButtonTitles[i] forState:UIControlStateNormal];
        
        button.backgroundColor = [UIColor purpleColor];
        
        [self.view addSubview:button];
        
        button.translatesAutoresizingMaskIntoConstraints = NO;
        button.tag = i;
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [button addTarget:self action:@selector(funcButtonsClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_funcButtons addObject:button];
        
        NSLayoutConstraint *heightCons = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:44];
        
        [self.view addConstraint:heightCons];
        
        CGFloat buttonWidth = ceil((CGRectGetWidth([UIScreen mainScreen].bounds) - 2) / 3.f);
        NSLayoutConstraint *widthCons = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:buttonWidth];
        
        [self.view addConstraint:widthCons];
        
        UIView *topItemView;
        UIView *leftItemView;
        NSLayoutAttribute leftItemAttribute;
        NSLayoutAttribute topItemAttribute;
        
        CGFloat topCostant = 20;
        CGFloat leftConstant = 0;
        
        if (i > 2) {
            topItemView = _funcButtons[0];
            topItemAttribute = NSLayoutAttributeBottom;
            topCostant = 1;
        } else {
            topItemView = self.view;
            topItemAttribute = NSLayoutAttributeTop;
        }
        
        if (i == 0 || i == 3) {
            leftItemView = self.view;
            leftItemAttribute = NSLayoutAttributeLeft;
        } else {
            leftItemView = _funcButtons[i - 1];
            leftItemAttribute = NSLayoutAttributeRight;
            leftConstant = 1;
        }
        
        NSLayoutConstraint *leftCons = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:leftItemView attribute:leftItemAttribute multiplier:1 constant:leftConstant];
        NSLayoutConstraint *topCons = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:topItemView attribute:topItemAttribute multiplier:1 constant:topCostant];
        
        [self.view addConstraints:@[leftCons, topCons]];
    }
}

- (void)setupInfoTableView {
    if (!_infoTableView) {
        _infoTableView = [[UITableView alloc] init];
        _infoTableView.hidden = YES;
        _infoTableView.translatesAutoresizingMaskIntoConstraints = NO;
//        _infoTableView.delegate = self;
//        _infoTableView.dataSource = self;
        
        [self.view addSubview:_infoTableView];
        
        //
        
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:_infoTableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_infoTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_funcButtons[3] attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:_infoTableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:_infoTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        
        [self.view addConstraints:@[left, top, right, bottom]];
    }
}

- (void)funcButtonsClicked:(UIButton *)button {
    XXMainFuncButtonsType buttonType = button.tag;
    
    if (_infoTableView.isHidden) {
        [_infoTableView setHidden:NO];
    }
    
    switch (buttonType) {
        case XXMainFuncButtonsTypeScore: {
            
            break;
        }
            
        default: {
            
            
            break;
        }
    }
}

@end
