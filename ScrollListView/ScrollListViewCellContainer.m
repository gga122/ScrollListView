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

#pragma mark - Private Methods

- (ScrollListViewCellGroup *)dequeCellGroupWithIdentifier:(NSString *)identifier {
    if (!identifier) {
        return nil;
    }
    return [self.mGroups objectForKey:identifier];
}



@end
