//
//  ARFramesInGridCalculator.m
//  Timer
//
//  Created by Gijs van Klooster on 06-12-13.
//  Copyright (c) 2013 Appy Road. All rights reserved.
//

#import "ARFramesInGridCalculator.h"



@implementation ARFramesInGridCalculator

- (id)initWithCellSize:(CGSize)cellSize rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount andDirection:(ARFramesInGridDirection)direction;
{
    self = [super init];
    if (self)
	{
		_cellSize		= cellSize;

		_initialOffset	= CGPointZero;
		_cellSpacing	= CGSizeZero;

		_rowCount		= rowCount == 0 ? NSIntegerMax : rowCount;
		_columnCount	= columnCount == 0 ? NSIntegerMax : columnCount;
		
		_gridDirection	= direction;
    }
	
    return self;
}

- (instancetype)initWithSingleColumnWithCellSize:(CGSize)cellSize
{
	return [self initWithCellSize:cellSize rowCount:0 columnCount:1 andDirection:ARFramesInGridDirectionVertical];
}

- (instancetype)initWithSingleRowWithCellSize:(CGSize)cellSize
{
	return [self initWithCellSize:cellSize rowCount:1 columnCount:0 andDirection:ARFramesInGridDirectionHorizontal];
}

#pragma mark - Public

- (CGRect)frameForIndex:(NSInteger)index
{
	if (index < 0) {
		return CGRectZero;
	}
	
	CGPoint point = [self originForIndex:index];
	CGRect retRect = CGRectMake(point.x, point.y, _cellSize.width, _cellSize.height);
	return retRect;
}

#pragma mark - Private

- (CGPoint)originForIndex:(NSInteger)index
{
	NSInteger xCount;
	NSInteger yCount;
	
	switch (_gridDirection)
	{
		case ARFramesInGridDirectionHorizontal: {
			xCount = index % _columnCount;
			yCount = (int) floorf(index / _columnCount);
			break;
		}
		case ARFramesInGridDirectionVertical: {
			xCount = (int) floorf(index / _rowCount);
			yCount = index % _rowCount;
			
			break;
		}
		default:
			break;
	}
	
	CGFloat xOffset = _initialOffset.x + (xCount * (_cellSize.width + _cellSpacing.width));
	CGFloat yOffset = _initialOffset.y + (yCount * (_cellSize.height + _cellSpacing.height));
	
	CGPoint retPoint = CGPointMake(xOffset, yOffset);
	return retPoint;
}

+ (CGFloat)widthForTotalWidth:(CGFloat)totalWidth count:(NSInteger)count horizontalMargin:(CGFloat)horizontalMargin
{
	if (count <= 0) {
		return 0.0;
	}
	
	return (totalWidth - ((count + 1) * horizontalMargin)) / count;
}

+ (CGFloat)horizontalSpacingForTotalWidth:(CGFloat)totalWidth cellWidth:(CGFloat)cellWidth count:(NSInteger)count
{
	return (totalWidth - (count * cellWidth)) / (count + 1);
}

@end
