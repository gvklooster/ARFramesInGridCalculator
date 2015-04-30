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
 * @param direction The ARFramesInGridDirection the grid will grow.
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


/**
 * The main reason for this calculator.
 *
 * @param index Index of the frame that will be returned.
 * @return The calculated frame for the index.
 */
- (CGRect)frameForIndex:(NSInteger)index;

#pragma mark - Tools

/**
 * When placing cells within a limited width, this will calculate and set the corresponding cellWidth and x value of initialOffset for perfect alignment.
 *
 * @param totalWidth The width where the cells need to be placed.
 * @param cellCount Amount of cells that need to be fitted within totalWidth.
 * @param horizontalMargin The margin between the cells and between the cell and edges.
 */
- (void)setCellWidthToFitWidth:(CGFloat)totalWidth numberOfCells:(NSInteger)cellCount horizontalMargin:(CGFloat)horizontalMargin;

/**
 * When placing cells within a limited width, this will calculate the corresponding cellWidth.
 *
 * @param totalWidth The width where the cells need to be placed.
 * @param cellCount Amount of cells that need to be fitted within totalWidth.
 * @param horizontalMargin The margin between the cells and between the cell and edges.
 * @return Calculated width for perfect layout. The return value is not rounded.
 */
+ (CGFloat)cellWidthToFitWidth:(CGFloat)totalWidth count:(NSInteger)cellCount horizontalMargin:(CGFloat)horizontalMargin;

/**
 * For a given cellSize and totalWidth, calculate and set spacing for even layout.
 *
 * @param totalWidth The width where the cells need to be placed.
 * @param cellWidth The width of the cell.
 * @param cellCount Amount of cells that need to be fitted within totalWidth.
 * @return The calculated spacing for perfect layout.
 */
- (void)setHorizontalMarginForTotalWidth:(CGFloat)totalWidth cellWidth:(CGFloat)cellWidth count:(NSInteger)cellCount;

/**
 * For a given cellSize and totalWidth, calculate spacing for even layout.
 *
 * @param totalWidth The width where the cells need to be placed.
 * @param cellWidth The width of the cell.
 * @param cellCount Amount of cells that need to be fitted within totalWidth.
 * @return The calculated spacing for perfect layout.
 */
+ (CGFloat)horizontalMarginForTotalWidth:(CGFloat)totalWidth cellWidth:(CGFloat)cellWidth count:(NSInteger)cellCount;

@end
