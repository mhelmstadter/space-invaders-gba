typedef struct {
	int row; 
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int bulletTimer;
} PLAYER;

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int active;
	int aniState;
	int aniCounter;
	int curFrame;
	int numFrames;
} ENEMY;


// Prototypes
void initGame();
void initPlayer();
void drawGame();
void drawPlayer();
void drawEnemy();
void updateGame();
void updatePlayer();
void updateEnemy();
void initEnemies();


// Definitions
#define ENEMYCOUNT 25

extern ENEMY enemies[ENEMYCOUNT];