//
//  ScrollListView.m
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "ScrollListView.h"
#import "ScrollListDocumentView.h"

/**
 * View Tree
 * 
 * ScrollView           -----------Top
 * ScrollListView       -----------Bottom
 *
 * View Layout (if 'HeaderView' and 'FooterView' Existed)
 * 
 * HeaderView           -----------Top
 * ScrollView           -----------Mid
 * FooterView           -----------Bottom
 */

static const float kScrollListViewLowLevelProprity = 750;

@interface ScrollListView ()

@property (nonatomic, strong) NSScrollView *mScrollView;
@property (nonatomic, strong) ScrollListDocumentView *mDocumentView;

/**
 * Used for control scrollView 'top' edge and 'bottom' edge to superView
 */
@property (nonatomic, strong) NSLayoutConstraint *mScrollViewTopLayout;
@property (nonatomic, strong) NSLayoutConstraint *mScrollViewBottomLayout;

@end

@implementation ScrollListView

#pragma mark - Overridden

- (instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        
        NSScrollView *tScrollView = [[NSScrollView alloc] initWithFrame:NSZeroRect];
        ScrollListDocumentView *tDocumentView = [[ScrollListDocumentView alloc] initWithFrame:NSZeroRect];
        tScrollView.documentView = tDocumentView;
        [self addSubview:tScrollView];
        
        //Use AutoLayout
        tScrollView.translatesAutoresizingMaskIntoConstraints = NO;
        NSDictionary *tViewDic = @{@"scrollView": tScrollView};
        NSArray *tScrollViewHorizonLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scrollView]-0-|" options:0 metrics:nil views:tViewDic];
        NSLayoutConstraint *tScrollViewTopLayout = [NSLayoutConstraint constraintWithItem:tScrollView.superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:tScrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        tScrollViewTopLayout.priority = kScrollListViewLowLevelProprity;    //Low Level Priority Option For HeaderView
        NSLayoutConstraint *tScrollViewBottomLayout = [NSLayoutConstraint constraintWithItem:tScrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:tScrollView.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        tScrollViewBottomLayout.priority = kScrollListViewLowLevelProprity; //Low Level Priority Option For FooterView
        
        [tScrollView.superview addConstraints:tScrollViewHorizonLayout];
        [tScrollView.superview addConstraint:tScrollViewTopLayout];
        [tScrollView.superview addConstraint:tScrollViewBottomLayout];
        
        self.mScrollViewTopLayout = tScrollViewTopLayout;
        self.mScrollViewBottomLayout = tScrollViewBottomLayout;
        
        self.mDocumentView = tDocumentView;
        self.mScrollView = tScrollView;
    }
    
    return self;
}


@end
