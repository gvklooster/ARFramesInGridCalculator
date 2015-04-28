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

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	CGSize cellSize = CGSizeMake(50.0, 30.0);
	
	self.framesInGridCalculator = [[ARFramesInGridCalculator alloc] initWithCellSize:cellSize rowCount:4 columnCount:4 andDirection:ARFramesInGridDirectionHorizontal];
	self.framesInGridCalculator.initialOffset = CGPointMake(20.0, 100.0);
	self.framesInGridCalculator.cellSpacing = CGSizeMake(10.0, 10.0);
	
	[self updateGridView];
}

- (void)updateGridView
{
	for (UIView *view in [self.view subviews]) {
		[view removeFromSuperview];
	}
	
	for (int i = 0; i < 15; i ++)
	{
		UILabel *test = [[UILabel alloc] initWithFrame:[self.framesInGridCalculator frameForIndex:i]];
		test.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
		test.text = [NSString stringWithFormat:@"%i", i];
		test.textAlignment = NSTextAlignmentCenter;
		[self.view addSubview:test];
	}
}

@end
