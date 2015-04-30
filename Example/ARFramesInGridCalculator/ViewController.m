//
//  ViewController.m
//  ARFramesInGridCalculator
//
//  Created by Gijs van Klooster on 29-04-15.
//  Copyright (c) 2015 Gijs van Klooster. All rights reserved.
//

#import "ViewController.h"
#import "ARFramesInGridCalculator.h"

@interface ViewController ()

@property (nonatomic, strong) ARFramesInGridCalculator *framesInGridCalculator;

@property (nonatomic, strong) UIView *gridContainerView;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	CGSize cellSize = CGSizeMake(50.0, 30.0);
	
	self.framesInGridCalculator = [[ARFramesInGridCalculator alloc] initWithCellSize:cellSize rowCount:4 columnCount:4 andDirection:ARFramesInGridDirectionHorizontal];
	self.framesInGridCalculator.cellSpacing = CGSizeMake(10.0, 10.0);
	[self.framesInGridCalculator setHorizontalSpacingForTotalWidth:CGRectGetWidth(self.view.bounds) cellWidth:cellSize.width count:4];
//	[self.framesInGridCalculator setCellWidthToFitWidth:CGRectGetWidth(self.view.bounds) numberOfCells:4 horizontalMargin:5];
	
	
	self.gridContainerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 200.0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
	self.gridContainerView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.3];
	[self.view addSubview:self.gridContainerView];
	
	[self updateGridContainerView];
	
	[self addControls];
}

- (void)updateGridContainerView
{
	for (UIView *view in [self.gridContainerView subviews]) {
		[view removeFromSuperview];
	}
	
	for (int i = 0; i < 14; i ++)
	{
		UILabel *test = [[UILabel alloc] initWithFrame:[self.framesInGridCalculator frameForIndex:i]];
		test.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
		test.text = [NSString stringWithFormat:@"%i", i];
		test.textAlignment = NSTextAlignmentCenter;
		[self.gridContainerView addSubview:test];
	}
}

- (void)addControls
{
	UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:@[@"Horizontal", @"Vertical"]];
	segControl.frame = CGRectMake(10.0, 40.0, CGRectGetWidth(self.view.bounds) - 20.0, 30.0);
	[segControl addTarget:self action:@selector(segmentedTapped:) forControlEvents:UIControlEventValueChanged];
	segControl.selectedSegmentIndex = 0;
	[self.view addSubview:segControl];
}

- (void)segmentedTapped:(UISegmentedControl *)sender
{
	switch (sender.selectedSegmentIndex)
	{
		case 0:
		{
			self.framesInGridCalculator.gridDirection = ARFramesInGridDirectionHorizontal;
			break;
		}
		case 1:
		{
			self.framesInGridCalculator.gridDirection = ARFramesInGridDirectionVertical;
			break;
		}
			
		default:
			break;
	}
	
	[self updateGridContainerView];
}

@end
