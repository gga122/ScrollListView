//
//  ScrollListCellView.m
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "ScrollListCellView.h"
#import "ScrollListCellViewConstant.h"

/**
 * View - Tree
 * 
 * ContentView          -----------Top
 * ContainerView        -----------Mid
 * CellView             -----------Bottom
 *
 * ContentView is designed for show detail view.
 * ContainerView is designed for 'Animation' and 'Cell Actions'
 */

@class ScrollListViewCellGroup;

@interface ScrollListCellView ()

@property (nonatomic, strong) NSView *mContainerView;
@property (nonatomic, strong) NSView *mContentView;

@property (nonatomic, strong) NSString *mIdentifier;
@property (nonatomic, weak) ScrollListViewCellGroup *mGroup;
@property (nonatomic, assign) ScrollListCellViewState state;

@end

@implementation ScrollListCellView

- (instancetype)initWithReuseIdentifier:(NSString *)identifier {
    if (self = [super initWithFrame:NSZeroRect]) {
        
        NSView *tContainerView = [[NSView alloc] initWithFrame:NSZeroRect];
        NSView *tContentView = [[NSView alloc] initWithFrame:NSZeroRect];
        [tContainerView addSubview:tContentView];
        [self addSubview:tContainerView];
        
        //Use AutoLayout For SubViews
        tContainerView.translatesAutoresizingMaskIntoConstraints = NO;
        tContentView.translatesAutoresizingMaskIntoConstraints = NO;
        NSDictionary *tViewDic = @{@"containerView": tContainerView, @"contentView": tContentView};
        
        NSArray *tContentViewHorizonLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[contentView]-0-|" options:0 metrics:nil views:tViewDic];
        NSArray *tContentViewVerticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[contentView]-0-|" options:0 metrics:nil views:tViewDic];
        [tContentView.superview addConstraints:tContentViewHorizonLayout];
        [tContentView.superview addConstraints:tContentViewVerticalLayout];
        
        NSArray *tContainerViewHorizonLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[containerView]-0-|" options:0 metrics:nil views:tViewDic];
        NSArray *tContainerViewVerticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[containerView]-0-|" options:0 metrics:nil views:tViewDic];
        [tContainerView.superview addConstraints:tContainerViewHorizonLayout];
        [tContainerView.superview addConstraints:tContainerViewVerticalLayout];
        
        self.mContainerView = tContainerView;
        self.mContentView = tContentView;
        self.mIdentifier = identifier;
    }
    
    return self;
}

#pragma mark - Public Property

- (NSString *)identifier {
    return self.mIdentifier;
}

- (NSView *)contentView {
    return self.mContentView;
}

@end