
//{{BLOCK(testing)

//======================================================================
//
//	testing, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 198 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 6336 + 2048 = 8896
//
//	Time-stamp: 2018-11-02, 03:53:00
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TESTING_H
#define GRIT_TESTING_H

#define testingTilesLen 6336
extern const unsigned short testingTiles[3168];

#define testingMapLen 2048
extern const unsigned short testingMap[1024];

#define testingPalLen 512
extern const unsigned short testingPal[256];

#endif // GRIT_TESTING_H

//}}BLOCK(testing)
