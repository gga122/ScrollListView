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
    if (!identifier) {
        return nil;
    }
    if (self = [super initWithFrame:NSZeroRect]) {
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


