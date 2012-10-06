//
//  PCViewController.m
//  MarqueeTest
//
//  Created by Evadne Wu on 10/4/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "PCViewController.h"

@interface PCViewController () <UIScrollViewDelegate>

@end

@implementation PCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	scrollView.bounces = YES;
	scrollView.alwaysBounceHorizontal = YES;
	scrollView.alwaysBounceVertical = YES;
	
	[self.view addSubview:scrollView];
	
	CGFloat width = CGRectGetWidth(scrollView.bounds);
	CGFloat height = CGRectGetHeight(scrollView.bounds);
	NSUInteger numberOfPages = 100;
	scrollView.delegate = self;
	scrollView.contentSize = (CGSize){
		numberOfPages * width,
		height
	};
	
	for (NSUInteger idx = 0; idx < numberOfPages; idx ++) {
		
		CGPoint centerPoint = (CGPoint){
			idx * width - 0.5f * width,
			0.5f * height
		};
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
		label.text = [NSString stringWithFormat:@"Page %i", idx];
		
		label.frame = (CGRect){
			width * idx,
			0,
			width,
			height
		};
		
//		label.center = centerPoint;
		
		[scrollView addSubview:label];
	
	};
	
	UIViewAnimationOptions options = UIViewAnimationOptionCurveLinear|UIViewAnimationOptionAllowUserInteraction;
	[UIView animateWithDuration:30.0f delay:0.0f options:options animations:^{
	
		[scrollView setContentOffset:(CGPoint){
			50 * width,
			0.0f
		} animated:NO];
		
	} completion:^(BOOL finished) {
	
		NSLog(@"%s %x", __PRETTY_FUNCTION__, finished);
		
	}];
	
}

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {

	//	?
	
	NSLog(@"contentOffset %@", NSStringFromCGPoint(scrollView.contentOffset));
	NSLog(@"scrollView.layer.bounds %@", NSStringFromCGRect(scrollView.layer.bounds));
	NSLog(@"scrollView.layer.presentationLayer.bounds %@", NSStringFromCGRect(((CALayer *)scrollView.layer.presentationLayer).bounds));
	
	CGRect bounds = ((CALayer *)scrollView.layer.presentationLayer).bounds;
	
	[scrollView.layer removeAllAnimations];
	[scrollView setContentOffset:bounds.origin animated:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
