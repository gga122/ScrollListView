//
//  ScrollListDocumentView.m
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "ScrollListDocumentView.h"

@implementation ScrollListDocumentView

- (void)drawRect:(NSRect)dirtyRect {
    [[NSColor yellowColor] set];
    NSRectFill(dirtyRect);
}

@end
