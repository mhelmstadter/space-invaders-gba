
//{{BLOCK(galaxy)

//======================================================================
//
//	galaxy, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 562 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 17984 + 2048 = 20544
//
//	Time-stamp: 2018-11-02, 12:04:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GALAXY_H
#define GRIT_GALAXY_H

#define galaxyTilesLen 17984
extern const unsigned short galaxyTiles[8992];

#define galaxyMapLen 2048
extern const unsigned short galaxyMap[1024];

#define galaxyPalLen 512
extern const unsigned short galaxyPal[256];

#endif // GRIT_GALAXY_H

//}}BLOCK(galaxy)
