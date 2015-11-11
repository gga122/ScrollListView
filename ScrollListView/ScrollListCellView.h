//
//  ScrollListCellView.h
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

/**
 * Single CellView For ScrollListView
 * You should subclass this if you want to design your own cellView.
 * You should try you best to reuse instance of this class or subclass of this class.
 */

#import <Cocoa/Cocoa.h>

@interface ScrollListCellView : NSView

- (instancetype)initWithReuseIdentifier:(NSString *)identifier;

@property (nonatomic, copy, readonly) NSString *identifier;

@end

