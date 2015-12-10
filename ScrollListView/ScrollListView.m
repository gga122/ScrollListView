//
//  ScrollListView.m
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "ScrollListView.h"
#import "ScrollListDocumentView.h"
#import "ScrollListViewCellContainer.h"

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
 * DocumentView Context
 */
@property (nonatomic, assign) CGFloat mDocumentViewHeight;
@property (nonatomic, assign) NSUInteger mSectionCount;

/**
 * Container for reuse Cells
 */
@property (nonatomic, strong) ScrollListViewCellContainer *mCellContainer;


@end

@implementation ScrollListView

#pragma mark - Overridden

- (instancetype)initWithFrame:(NSRect)frameRect {
    if (self =[super initWithFrame:frameRect]) {
        NSRect tRect = NSMakeRect(0, 0, NSWidth(frameRect), NSHeight(frameRect));

        ScrollListDocumentView *tDocumentView = [[ScrollListDocumentView alloc] initWithFrame:tRect];
        tDocumentView.autoresizingMask = NSViewNotSizable;
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
        [tDocumentView registerViewNotifications];
        
        self.mScrollView = tScrollView;
    }
    return self;
}


#pragma mark - DataSource / Delegate

- (void)setDataSource:(id<ScrollListViewDataSource>)dataSource {
    if (_dataSource != dataSource) {
        _dataSource = dataSource;
        _mSectionCount = 1;
        if ([_dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
            self.mSectionCount = [_dataSource numberOfSectionsInTableView:self];
        }
    }
}

#pragma mark - Queue

- (ScrollListCellView *)dequeueReusableCellWithIdentifier:(NSString *)identifier {
    if (!identifier) {
        return nil;
    }
    return [self.mCellContainer preparedForReuseCellWithIdentifier:identifier];
}

#pragma mark - FooterView and HeaderView

- (void)setScrollListFooterView:(NSView *)scrollListFooterView {
    if (_scrollListFooterView != scrollListFooterView) {
        [_scrollListFooterView removeFromSuperviewWithoutNeedingDisplay];
        _scrollListFooterView = scrollListFooterView;
        if (_scrollListFooterView) {
            [self addSubview:_scrollListFooterView];
            _scrollListFooterView.translatesAutoresizingMaskIntoConstraints = NO;
            
            CGFloat tHeight = NSWidth(_scrollListFooterView.frame);
            NSLayoutConstraint *tHeightLayout = [NSLayoutConstraint constraintWithItem:_scrollListFooterView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:tHeight];
            [_scrollListFooterView addConstraint:tHeightLayout];
            
            NSDictionary *viewDic = @{@"footerView": _scrollListFooterView, @"scrollView": self.mScrollView};
            NSArray *tHorizonLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[footerView]-0-|" options:0 metrics:nil views:viewDic];
            [_scrollListFooterView.superview addConstraints:tHorizonLayout];
            
            NSArray *tVerticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[scrollView]-0-[footerView]-0-|" options:0 metrics:nil views:viewDic];
            [_scrollListFooterView.superview addConstraints:tVerticalLayout];
        }
    }
}

- (void)setScrollListHeaderView:(NSView *)scrollListHeaderView {
    if (_scrollListHeaderView != scrollListHeaderView) {
        [_scrollListHeaderView removeFromSuperviewWithoutNeedingDisplay];
        _scrollListHeaderView = scrollListHeaderView;
        if (_scrollListHeaderView) {
            [self addSubview:_scrollListHeaderView];
            _scrollListHeaderView.translatesAutoresizingMaskIntoConstraints = NO;
            
            CGFloat tHeight = NSWidth(_scrollListHeaderView.frame);
            NSLayoutConstraint *tHeightLayout = [NSLayoutConstraint constraintWithItem:_scrollListHeaderView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:tHeight];
            [_scrollListHeaderView addConstraint:tHeightLayout];
            
            NSDictionary *viewDic = @{@"headerView": _scrollListHeaderView, @"scrollView": self.mScrollView};
            NSArray *tHorizonLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[headerView]-0-|" options:0 metrics:nil views:viewDic];
            [_scrollListHeaderView.superview addConstraints:tHorizonLayout];
            
            NSArray *tVerticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[headerView]-0-[scrollView]" options:0 metrics:nil views:viewDic];
            [_scrollListHeaderView.superview addConstraints:tVerticalLayout];
        }
    }
}

#pragma mark - Private Property

- (void)setMSectionCount:(NSUInteger)mSectionCount {
    if (_mSectionCount != mSectionCount) {
        _mSectionCount = mSectionCount;
        
    }
}

@end