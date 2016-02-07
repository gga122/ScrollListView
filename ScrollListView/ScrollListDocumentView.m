//
//  ScrollListDocumentView.m
//  ScrollListView
//
//  Created by Henry on 15/11/9.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "ScrollListDocumentView.h"

static CGFloat const kScrollListDocumentViewMaxBufferFactor = 2.5;

@interface ScrollListDocumentView ()

@property (nonatomic, assign) CGFloat mWidth;
@property (nonatomic, assign) CGFloat mHeight;

@end

@implementation ScrollListDocumentView

#pragma mark - Overridden

- (BOOL)isFlipped {
    return YES;
}

- (void)dealloc {
    [self unRegisterViewNotifications];
}

#pragma mark - Calculate

- (void)calculateDocumentViewHeight {
    
}

#pragma mark - Layout

- (void)layoutCellViews {
    
}

#pragma mark - Public Method

- (void)registerViewNotifications {
    [self unRegisterViewNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(boundsDidChanged:) name:NSViewBoundsDidChangeNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enclosingScrollViewFrameDidChanged:) name:NSViewFrameDidChangeNotification object:self.enclosingScrollView];
    NSLog(@"Document View Notifications Register");
}

- (void)unRegisterViewNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSViewFrameDidChangeNotification object:self.enclosingScrollView];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSViewBoundsDidChangeNotification object:self];
    NSLog(@"Document View Notifications Unregister");
}

#pragma mark - Frame/Bounds Changed Notification

- (void)boundsDidChanged:(NSNotification *)noti {
    NSLog(@"ScrollListDocumentView Bounds Did Changed");
}

- (void)enclosingScrollViewFrameDidChanged:(NSNotification *)noti {
    NSLog(@"ScrollListDocument EnclosingScrollView Frame Did Changed");
    self.mWidth = NSWidth(self.enclosingScrollView.frame);
    self.mHeight = NSHeight(self.enclosingScrollView.frame);
}

- (void)drawRect:(NSRect)dirtyRect {
    [[NSColor yellowColor] set];
    NSRectFill(dirtyRect);
}

#pragma mark - Private Property

- (void)setMWidth:(CGFloat)mWidth {
    if (NSWidth(self.frame) != mWidth) {
        NSRect rect = self.frame;
        rect.size.width = mWidth;
        self.frame = rect;
    }
}

- (CGFloat)mWidth {
    return NSWidth(self.frame);
}

- (void)setMHeight:(CGFloat)mHeight {
    if (NSHeight(self.frame) < mHeight) {
        NSRect rect = self.frame;
        rect.size.height = mHeight;
        self.frame = rect;
    }
}

- (CGFloat)mHeight {
    return NSHeight(self.frame);
}

@end