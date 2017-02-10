#import "KNRootViewController.h"

@implementation KNRootViewController {
	NSMutableArray *_objects;
}

- (void)loadView {
	[super loadView];

	_objects = [[NSMutableArray alloc] init];

	self.title = @"change to single";
	
}

@end
