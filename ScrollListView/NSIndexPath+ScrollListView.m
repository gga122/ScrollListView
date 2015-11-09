//
//  NSIndexPath+ScrollListView.m
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "NSIndexPath+ScrollListView.h"

@implementation NSIndexPath (ScrollListView)

+ (instancetype)indexPathForRow:(NSUInteger)row inSection:(NSUInteger)section {
    NSUInteger path[] = {section, row};
    NSIndexPath *indexPath = [[NSIndexPath alloc] initWithIndexes:path length:2];
    return indexPath;
}

- (NSInteger)section {
    return [self indexAtPosition:0];
}

- (NSInteger)row {
    return [self indexAtPosition:1];
}

- (NSString *)description {
    NSMutableString *desc = [NSMutableString stringWithString:[super description]];
    [desc appendString:[NSString stringWithFormat:@"Section:%lu Row:%lu", self.section, self.row]];
    return desc;
}

@end
