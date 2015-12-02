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
    if (self =[super initWithFrame:frameRect]) {
        NSRect tRect = NSMakeRect(0, 0, NSWidth(frameRect), NSHeight(frameRect));
        
        ScrollListDocumentView *tDocumentView = [[ScrollListDocumentView alloc] initWithFrame:tRect];
        tDocumentView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        self.mDocumentView = tDocumentView;
        
        NSScrollView *tScrollView = [[NSScrollView alloc] initWithFrame:tRect];
        [self addSubview:tScrollView];
        tScrollView.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSDictionary *viewDic = @{@"scrollView": tScrollView, @"documentView": tDocumentView};
        NSLayoutConstraint *tScrollViewTopLayout = [NSLayoutConstraint constraintWithItem:tScrollView.superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:tScrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        tScrollViewTopLayout.priority = kScrollListViewLowLevelProprity;    //Low Level Priority Option For HeaderView
        [tScrollView.superview addConstraint:tScrollViewTopLayout];
        NSLayoutConstraint *tScrollViewBottomLayout = [NSLayoutConstraint constraintWithItem:tScrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:tScrollView.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        tScrollViewBottomLayout.priority = kScrollListViewLowLevelProprity; //Low Level Priority Option For FooterView
        [tScrollView.superview addConstraint:tScrollViewBottomLayout];
        NSArray *tScrollHorizonLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scrollView]-0-|" options:0 metrics:nil views:viewDic];
        [tScrollView.superview addConstraints:tScrollHorizonLayout];
        tScrollView.hasVerticalScroller = YES;
        tScrollView.scrollerStyle = NSScrollerStyleOverlay;
        tScrollView.documentView = tDocumentView;
        self.mScrollView = tScrollView;
    }
    return self;
}

- (void)dealloc {
    
}

@end
