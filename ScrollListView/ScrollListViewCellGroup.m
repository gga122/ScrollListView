//
//  ScrollListViewCellGroup.m
//  ScrollListView
//
//  Created by Henry on 15/11/10.
//  Copyright © 2015年 Henry. All rights reserved.
//

#import "ScrollListViewCellGroup.h"
#import "ScrollListCellView.h"

@interface ScrollListViewCellGroup ()

@property (nonatomic, strong) NSMutableArray *mCells;       //Contain all cells with same identifier.
@property (nonatomic, strong) NSMutableArray *mUsingCells;  //Contain 'USING' Cells
@property (nonatomic, strong) NSMutableArray *mReuseCells;  //Contain 'REUSE' Cells

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

#pragma mark - Public Property

- (NSArray *)cells {
    if (self.mCells.count == 0) {
        return nil;
    }
    return [NSArray arrayWithArray:self.mCells];
}

#pragma mark - Private Property

- (NSMutableArray *)mCells {
    if (!_mCells) {
        _mCells = [NSMutableArray array];
    }
    return _mCells;
}

@end

@implementation ScrollListViewCellGroup (Extend)

- (void)addCell:(id)cell {
   
}

- (void)removeCell:(id)cell {
    
}

- (void)resetGroup {
    
}

- (ScrollListCellView *)preparedForReuseCell {
    if (self.mReuseCells.count == 0) {
        return nil;
    }
    ScrollListCellView *tCell = self.mReuseCells.firstObject;
    [tCell prepareForReuse];
    return tCell;
}

@end