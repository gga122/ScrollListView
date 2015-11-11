//
//  ScrollListViewCellContainer.h
//  ScrollListView
//
//  Created by Henry on 15/11/10.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ScrollListCellView;

/**
 * Manager Container for cell STORAGE/REUSE
 *
 */

@interface ScrollListViewCellContainer : NSObject

@end

/**
 * Define Basic Action Method For Class Container
 */

@interface ScrollListViewCellContainer (Extend)

/**
 * Request a cell if prepared for reuse with give identifier. Return nil when no cells prepared or no groups matched.
 */
- (ScrollListCellView *)preparedForReuseCellWithIdentifier:(NSString *)identifier;

/**
 * This method will remove all groups' Ref in container.
 */
- (void)resetContainer;

@end