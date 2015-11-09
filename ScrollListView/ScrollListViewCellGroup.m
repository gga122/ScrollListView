//
//  ScrollListViewCellGroup.m
//  ScrollListView
//
//  Created by Henry on 15/11/10.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "ScrollListViewCellGroup.h"

@interface ScrollListViewCellGroup ()

@property (nonatomic, strong) NSMutableArray *mCells;

@end

@implementation ScrollListViewCellGroup

#pragma mark - Intialize

- (id)initWithIdentifer:(NSString *)identifier {
    NSParameterAssert(identifier);
    if (self = [super init]) {
        _identifier = identifier;
    }
    return self;
}

@end
