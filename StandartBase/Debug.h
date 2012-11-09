//
//  Created by anlcan on 11/10/09.
//  Copyright 2009 pozitron. All rights reserved.
//

// inspired from iPhone Advanced Projects book.

#if defined (DEBUG)

#define _ASSERT(STATEMENT) do { assert(STATEMENT); } while(0)
//#define _NSLog(format, ...) NSLog(@"%@ | %s [Line %d] ",  [NSString stringWithFormat:format,## __VA_ARGS__ ],__FUNCTION__, __LINE__);		// always needs NSString as the first parameters

#define _NSLog(format, ...) fprintf(stdout, "%s  <Line %d> %s\n",__FUNCTION__, __LINE__,  [[NSString stringWithFormat:format,## __VA_ARGS__ ]UTF8String]);		// always needs NSString as the first parameters


#else

#define _ASSERT(STATEMENT) do { (void) sizeof(STATEMENT); } while(0)
#define _NSLog(format, ...)


#endif 
