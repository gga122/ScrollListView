//
//  ScrollListCellView.m
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "ScrollListCellView.h"
#import "ScrollListCellViewConstant.h"

@class ScrollListViewCellGroup;

@interface ScrollListCellView () {
    NSString *_mIdentifier;
}

@property (nonatomic, weak) ScrollListViewCellGroup *mGroup;
@property (nonatomic, assign) ScrollListCellViewState state;

@end

@implementation ScrollListCellView

- (instancetype)initWithReuseIdentifier:(NSString *)identifier {
    if (!identifier) {
        return nil;
    }
    if (self = [super initWithFrame:NSZeroRect]) {
        _mIdentifier = identifier;
    }
    return self;
}

#pragma mark - Public Property

- (NSString *)identifier {
    return _mIdentifier;
}

@end


