//
//  ScrollListViewCellGroup.h
//  ScrollListView
//
//  Created by Henry on 15/11/10.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ScrollListCellView;

@interface ScrollListViewCellGroup : NSObject

- (instancetype)initWithIdentifer:(NSString *)identifier;

@property (nonatomic, copy, readonly) NSString *identifier;

@property (nonatomic, strong, readonly) NSArray *cells;

@end

/**
 * Define Basic Action Method For Class Group
 */
@interface ScrollListViewCellGroup (Extend)

/**
 * After ScrollListView delegate method 'scrollListView:cellForViewAtIndexPath:' , this method need to call for reuse cell by add in group with identifier.
 */
- (void)addCell:(id)cell;

/**
 * In general,this method need not call directly.
 */
- (void)removeCell:(id)cell;

/**
 * This method will remove all cells' Ref in group.
 */
- (void)resetGroup;

/**
 * Request a cell if prepared for reuse. Return nil when no cells prepared.
 */
- (ScrollListCellView *)preparedForReuseCell;


@end