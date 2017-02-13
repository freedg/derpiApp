#import "KNRootViewController.h"
#import "Classes/SBJson5.h"

@implementation KNRootViewController {
	NSMutableArray *_objects;
}

- (void)loadView {
	[super loadView];

	_objects = [[NSMutableArray alloc] init];
	self.title = @"derpi";
	self.view = [[[UIView alloc]initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
	self.view.backgroundColor = [UIColor whiteColor];
	/*
	UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,150,300,20)];
	[testLabel setText:@"big boot"];	
	[self.view addSubview:testLabel];
	*/	
	/*
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10,300,101,150)];
	NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString: @"https://derpicdn.net/img/2015/4/30/885907/thumb_small.jpg"]];
	imageView.image = [UIImage imageWithData:imageData];
	[self.view addSubview:imageView];
	*/
	NSData *data = [[NSData alloc]initWithContentsOfURL: [NSURL URLWithString:@"https://derpibooru.org/images.json"]];
	NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
	NSArray *images = [s objectForKey:@"images"];
	NSDictionary *firstImages = images[0];
	NSDictionary *representations = firstImages[@"representations"];

	NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat: @"https:%@",representations[@"thumb_small"]]]];
	UIImage *image = [UIImage imageWithData:imageData];
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10,75,image.size.height,image.size.width)];
	imageView.image = image;
	[self.view addSubview:imageView];

	UILabel *imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,50,300,300)];
	[imageLabel setText:[NSString stringWithFormat:@"%f x %f",imageView.image.size.width, imageView.image.size.height]];
	[self.view addSubview:imageLabel];
}

@end
