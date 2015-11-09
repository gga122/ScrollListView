//
//  NSIndexPath+ScrollListView.h
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

/**
 * Extension for IndexPath, Designed For ScrollListView
 */

#import <Foundation/Foundation.h>

@interface NSIndexPath (ScrollListView)

+ (instancetype)indexPathForRow:(NSUInteger)row inSection:(NSUInteger)section;

@property (nonatomic, readonly) NSInteger section;
@property (nonatomic, readonly) NSInteger row;

@end