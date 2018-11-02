#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Variables
int lives;

// Sprite Variables
PLAYER player;
ENEMY enemies[ENEMYCOUNT];


// Shadow OAM
OBJ_ATTR shadowOAM[128];

void initGame() {
	initPlayer();
	initEnemies();
}

void initPlayer() {
	player.width = 16;
	player.height = 8;
	player.rdel = 2;
	player.cdel = 2;
	player.row = 150;
	player.col = 112;
	player.bulletTimer = 20;
}

void initEnemies() {
	// Row
	int row = 0;
	// State
	int aniState = 0;

	// Iterate over enemies to give them initial values
	for (int i = 0; i < ENEMYCOUNT; i++) {
		// If starting a new row
		if (i % 5 == 0) {
			enemies[i].col = 20;
			row += 20;
			// Change/set the state
			if (aniState <= 3) {
				aniState += 2;
			} else {
				aniState = 0;
			}
		} else {
			// Just update the col, state remains same
			enemies[i].col = enemies[i - 1].col + 31;
		}
		
		enemies[i].row = row;
		enemies[i].rdel = 2;
		enemies[i].cdel = -1;
		enemies[i].width = 16;
		enemies[i].height = 16;
		enemies[i].active = 1;
		enemies[i].aniState = aniState;
		enemies[i].aniCounter = 0;
		enemies[i].curFrame = 0;
		enemies[i].numFrames = 2;
	}
}

void drawGame() {
	// Draw Player
	drawPlayer();

	// Draw All Enemies
	for (int i = 0; i < ENEMYCOUNT; i++) {
		ENEMY *e = &enemies[i];
		// Index to use in shadowOAM
		drawEnemy(e, i + 6);
	}
}

void drawPlayer() {
	shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[0].attr1 = player.col | ATTR1_TINY;
	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0,0);
}


void drawEnemy(ENEMY* e, int index) {
	//  Frames are the rows of the spritesheet, and animation states are the columns
	if (e->active) {
		shadowOAM[index].attr0 = e->row | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[index].attr1 = e->col | ATTR1_SMALL;
		shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(e->curFrame * 2 + 2, e->aniState);
	} else {
		shadowOAM[index].attr0 = ATTR0_HIDE;
	}
}

// Updates the game
void updateGame() {
	// Update the player
	updatePlayer();
	// Update all enemies
	for (int i = 0; i < ENEMYCOUNT; i++) {
		ENEMY *e = &enemies[i];
		updateEnemy(e);
	}
}

void updatePlayer() {
	if (BUTTON_HELD(BUTTON_RIGHT) && player.col  + player.width < 238) {
		player.col++;
	}

	if (BUTTON_HELD(BUTTON_LEFT) && player.col > 2) {
		player.col--;
	}
}

void updateEnemy(ENEMY* e) {

	// Change the animation frame every 20 frames of gameplay
	if (e->aniCounter % 20 == 0) {
		if (e->curFrame < e->numFrames - 1) {
			e->curFrame++;
		} else {
			e->curFrame = 0;
		}
	}
	e->aniCounter++;

	// Handles enemies movement after hitting wall
	for (int i = 0; i < ENEMYCOUNT; i++) {
		// If enemy reaches left or right boundary
		if (enemies[i].col < 1 || enemies[i].col + enemies[i].width > SCREENWIDTH - 1) {
			e->cdel *= -1;
			e->row += e->rdel;
		}
	}

	e->col += e->cdel;
}