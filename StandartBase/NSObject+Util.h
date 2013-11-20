//
//  Created by Anil Can Baykal on 3/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>




//==============================================================================
#define __loadNibNamed(x,y)  	(x *)[[[NSBundle mainBundle] loadNibNamed:_className(x) owner:y options:nil] lastObject]
#define _loadNibNamed(x)		(x *)[[[NSBundle mainBundle] loadNibNamed:_className(x) owner:nil options:nil] lastObject]
#define _ownNibNamed(x)			(x *)[[[NSBundle mainBundle] loadNibNamed:_className(x) owner:self options:nil] lastObject]



//==============================================================================
#define _updateOrigin(o, x, y)	CGRect f = o.frame; f.origin = CGPointMake(x,y); o.frame = f;
#define _updateOriginX(o, x) _updateOrigin(o, x, o.frame.origin.y); 
#define _updateOriginY(o, y) _updateOrigin(o, o.frame.origin.x, y); 


