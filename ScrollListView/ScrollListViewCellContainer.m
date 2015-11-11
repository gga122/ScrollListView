//
//  ScrollListViewCellContainer.m
//  ScrollListView
//
//  Created by Henry on 15/11/10.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "ScrollListViewCellContainer.h"
#import "ScrollListViewCellGroup.h"

@interface ScrollListViewCellContainer ()

@property (nonatomic, strong) NSMutableDictionary *mGroups;

@end

@implementation ScrollListViewCellContainer

- (NSMutableDictionary *)mGroups {
    if (!_mGroups) {
        _mGroups = [NSMutableDictionary dictionary];
    }
    return _mGroups;
}

@end

@implementation ScrollListViewCellContainer (Extend)

- (ScrollListViewCellGroup *)cellGroupWithIdentifier:(NSString *)identifier {
    if (identifier.length == 0 || self.mGroups.count == 0) {
        return nil;
    }
    return [self.mGroups objectForKey:identifier];
}

- (ScrollListCellView *)preparedForReuseCellWithIdentifier:(NSString *)identifier {
    ScrollListViewCellGroup *tGroup = [self cellGroupWithIdentifier:identifier];
    if (!tGroup) {
        return nil;
    }
    return [tGroup preparedForReuseCell];
}

- (void)resetContainer {
    [self.mGroups removeAllObjects];
}

@end