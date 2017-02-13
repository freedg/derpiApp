#import "KNRootViewController.h"

@implementation KNRootViewController {
	NSMutableArray *_objects;
}

- (void)loadView {
	[super loadView];

	_objects = [[NSMutableArray alloc] init];
	self.title = @"derpi";
	self.view = [[[UIView alloc]initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
	self.view.backgroundColor = [UIColor whiteColor];
	
	UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,150,300,20)];
	[testLabel setText:@"big boot"];	
	[self.view addSubview:testLabel];
	
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10,300,101,150)];
	NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString: @"https://derpicdn.net/img/2015/4/30/885907/thumb_small.jpg"]];
	imageView.image = [UIImage imageWithData:imageData];
	[self.view addSubview:imageView];

}

@end
