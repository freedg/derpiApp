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
	
	UIScrollView *wowView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height)];
	wowView.scrollEnabled = YES;
	wowView.showsVerticalScrollIndicator = YES;

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

	NSData *data = [[NSData alloc]initWithContentsOfURL: [NSURL URLWithString:@"https://trixiebooru.org/images.json"]];
	NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
	NSArray *images = [s objectForKey:@"images"];
	NSMutableArray *allImages = [[NSMutableArray alloc]init];
	
	CGFloat y = 5.0;
	for (int i=1; i < [images count]; i++) {
		NSDictionary *imageDict = images[i];
		NSDictionary *representations = imageDict[@"representations"];

		NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https:%@",representations[@"thumb_small"]]]];
		UIImage *image = [UIImage imageWithData:imageData];
		UIImageView *imageView;
		if (i%2 != 0) {
			imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5,y,image.size.width,image.size.height)];
		} else {
			imageView = [[UIImageView alloc] initWithFrame:CGRectMake(165,y,image.size.width,image.size.height)];
			y += 155;
		}
		imageView.image = image;

		[allImages addObject:imageView];
	}	
	wowView.contentSize = CGSizeMake(self.view.bounds.size.width, y);
	[self.view addSubview:wowView];
	
	for (UIImageView *imageView in allImages) {
		[wowView addSubview:imageView];
	}

	/*
	UILabel *imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,50,300,300)];
	[imageLabel setText:[NSString stringWithFormat:@"%f x %f",imageView.image.size.height, imageView.image.size.width]];
	[self.view addSubview:imageLabel];
	*/
}

@end
