//
//  ARFramesInGridCalculator.h
//  Timer
//
//  Created by Gijs van Klooster on 06-12-13.
//  Copyright (c) 2014 Appy Road. All rights reserved.
//

typedef enum {
	ARFramesInGridDirectionHorizontal,	// will place the next right of the previous, only when coloumnCount has been reached we go down 1 row.
	ARFramesInGridDirectionVertical		// will place the next under the previous, only when rowCount has been reached we go right 1 column.
}ARFramesInGridDirection;


/**
 * This class is a helper class to easily calculate the frame in a grid.
 * After setting a few parameters in the init function you can call frameForIndex: to get the frame you want.
 */


@interface ARFramesInGridCalculator : NSObject


/**
 * Designated Initializer
 *
 * @param cellSize Size of the cell.
 * @param rowCount Amount of rows wanted. Setting this to 0 will not limit the amount of rows created.
 * @param columnCount Amount of columns wanted. Setting this to 0 will not limit the amount of columns created.
 * @param direction The TSFramesInGridDirection the grid will grow.
 *
 * @return initialized self.
 */
- (instancetype)initWithCellSize:(CGSize)cellSize rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount andDirection:(ARFramesInGridDirection)direction;

- (instancetype)initWithSingleColumnWithCellSize:(CGSize)cellSize;
- (instancetype)initWithSingleRowWithCellSize:(CGSize)cellSize;


/** can specify initial offset, defaults to CGPointZero */
@property (nonatomic, assign) CGPoint initialOffset;

/** space between the frames */
@property (nonatomic, assign) CGSize cellSpacing;

/** size of the frames */
@property (nonatomic, assign) CGSize cellSize;

/** amount of rows that will be used before new colomn is created. Setting this to 0 will not limit the amount of rows created */
@property (nonatomic, assign) NSInteger rowCount;

/** amount of columns that will be used before new row is created. Setting this to 0 will not limit the amount of columns created */
@property (nonatomic, assign) NSInteger columnCount;

/** see description above */
@property (nonatomic, assign) ARFramesInGridDirection gridDirection;


/** The main reason for this Class: calculate this for me! */
- (CGRect)frameForIndex:(NSInteger)index;

/** when placing cells within a limited width, this will calculate the corresponding cellWidth. The return value is not rounded.*/
+ (CGFloat)widthForTotalWidth:(CGFloat)totalWidth count:(NSInteger)count horizontalMargin:(CGFloat)horizontalMargin;

/** for a given cellSize and totalWidth, calculate spacing for even layout. The return value is not rounded */
+ (CGFloat)horizontalSpacingForTotalWidth:(CGFloat)totalWidth cellWidth:(CGFloat)cellWidth count:(NSInteger)count;

@end
