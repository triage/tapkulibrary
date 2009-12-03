//
//  TKTimeGraphController.m
//  Created by Devin Ross on 7/24/09.
//
/*
 
 tapku.com || http://github.com/tapku/tapkulibrary/tree/master
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "TKGraphController.h"
#import "TKGlobal.h"
#import "UIImageAdditions.h"

@implementation TKGraphController
@synthesize graph;

- (id) init{
	if(self == [super init]){
		
	}
	return self;
}


- (void) loadView{
	NSLog(@"LoadView");
	graph = [[TKGraph alloc] initWithFrame:CGRectMake(0, 0, 480, 300)];
	graph.dataSource = self;
	graph.backgroundColor = [UIColor whiteColor];
	
	self.view = graph;


}


- (void)viewDidLoad {
    
	//graph = [[TKGraph alloc] initWithFrame:CGRectMake(0, 0, 480, 300)];
	//graph.dataSource = self;
	//graph.backgroundColor = [UIColor whiteColor];
	//[self.view addSubview:graph];
	
	close = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	close.frame = CGRectMake(-10, 0, 60, 40);
	
	
	
	[close setImage:[UIImage imageFromPath:TKBUNDLE(@"TapkuLibrary.bundle/Images/graph/close.png")] forState:UIControlStateNormal];
	[close setImage:[UIImage imageFromPath:TKBUNDLE(@"TapkuLibrary.bundle/Images/graph/close_touch.png")] forState:UIControlStateHighlighted];
	[close addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:close];
	
	[super viewDidLoad];
 
}


- (void)viewWillAppear:(BOOL)animated {
	 [super viewWillAppear:animated];
	 statusColor = [UIApplication sharedApplication].statusBarStyle;
	 [UIApplication sharedApplication].statusBarStyle =  UIStatusBarStyleBlackOpaque;
 }
- (void)viewWillDisappear:(BOOL)animated {
	 [super viewWillDisappear:animated];
	 [UIApplication sharedApplication].statusBarStyle =  statusColor;
 }



- (void) close{
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark  TKGraph Delegate Methods

- (NSString*) titleForGraph:(TKGraph*)graph{
	return nil;
}
- (NSInteger) numberofPointsOnGraph:(TKGraph*)graph{
	return 0;
}
- (NSNumber*) graph:(TKGraph*)graph yValueForPoint:(int)x{
	return [NSNumber numberWithInt:0];
}
- (NSString*) graph:(TKGraph*)graph xLabelForPoint:(int)x{
	return nil;
}
- (NSString*) graph:(TKGraph*)graph yLabelForValue:(float)value{
	return nil;
}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
- (void)dealloc {
    [super dealloc];
}


@end
